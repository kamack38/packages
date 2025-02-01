$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.0/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.0/tree-sitter-windows-x64.gz'
  checksum       = 'a6363eb843bddc64715479822d9879a447f0633f7eb5d06ffbadceb3f41dc368'
  checksum64     = 'e5647e0672c9bae3a2b10b1f28a2b483f49f506c034e54f8cf8740f6ea27e1e1'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
