#!/bin/bash
source PKGBUILD

echo "Package url: $url"
echo "Current package version: $pkgver"
echo "Current package source: $source"
ver=$(pkgver)
source=$(echo $source | sed -e "s/$pkgver/$ver/")
pkgver=$ver
echo "Updated version: $pkgver"
echo "Updated source: $source"

sha256sums() {
    curl -sL "$source" | sha256sum | head -c 64
}

file=$(cat PKGBUILD)
sha256="\(\'$(sha256sums)\'\)"

echo "SHA256 Sums: $sha256"
echo "$file" | sed -e "s/sha256sums=('.*')/sha256sums=$sha256/" | sed -e "s/pkgver=.*/pkgver=$pkgver/" >PKGBUILD
