#!/bin/bash
source PKGBUILD

pkgver=$(pkgver)

echo "Package version: $pkgver"

sha256sums() {
    curl -s "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64" | sha256sum | head -c 64
}

file=$(cat PKGBUILD)
sha256="\(\'$(sha256sums)\'\)"

echo "SHA256 Sums: $sha256"
echo "$file" | sed -e "s/sha256sums=('.*')/sha256sums=$sha256/" | sed -e "s/pkgver=.*/pkgver=$pkgver/" >PKGBUILD
