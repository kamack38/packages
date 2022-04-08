#!/bin/bash
cd "$(dirname "$0")"
source PKGBUILD

sha256sums() {
    curl -sL "$1" | sha256sum | head -c 64
}

newver=$(pkgver)

if [[ "$newver" != "$pkgver" ]]; then
    echo "Updating package..."
    source=$(echo $source | sed -e "s/$pkgver/$ver/")
    file=$(cat PKGBUILD)
    sha256="('$(sha256sums $source)')"
    echo "Package version: $newver"
    echo "SHA256 Sums: $sha256"
    echo "$file" | sed -e "s/sha256sums=('.*')/sha256sums=$sha256/" | sed -e "s/pkgver=.*/pkgver=$newver/" >PKGBUILD
else
    echo "No updates available!"
fi
