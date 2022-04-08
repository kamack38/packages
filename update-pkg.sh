#!/bin/bash -

# First arg selects name of the package to be updated
# if not specified updates all packages

updatedPackages="[ "

genSha256Sums() {
    curl -sL "$1" | sha256sum | head -c 64
}

# 1 - path to PKGBUILD
updatePKG() {
    source $1
    echo "Checking for updates..."
    newver=$(pkgver)
    if [[ "$newver" != "$pkgver" ]]; then
        echo "Updating package..."
        source=$(echo $source | sed -e "s/$pkgver/$newver/")
        file=$(cat $1)
        sha256="('$(genSha256Sums $source)')"
        echo "Package version: $newver"
        echo "SHA256 Sums: $sha256"
        updatedPackages+="'$pkgname', "
        echo "$file" | sed -e "s/sha256sums=('.*')/sha256sums=$sha256/" | sed -e "s/pkgver=.*/pkgver=$newver/" >$1
    else
        echo "No updates available!"
    fi
}

if [[ $1 == "" ]]; then
    for n in $(find . | grep 'PKGBUILD'); do
        IFS='/' read -r -a array <<<"$n"
        echo "Processing ${array[2]}"
        updatePKG $n
    done
else
    if [[ -f "./packages/$1/PKGBUILD" ]]; then
        updatePKG "./packages/$1/PKGBUILD"
    else
        echo "This package does not exist!"
    fi
fi

updatedPackages+="]"

echo "::set-output name=updatedPackages::$updatedPackages"
