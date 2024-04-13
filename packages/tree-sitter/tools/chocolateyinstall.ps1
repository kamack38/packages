$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.4/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.22.4/tree-sitter-windows-x64.gz'
  checksum       = '35e32c0795a6c876554daa97233cd0ee843d5d95605029848ab555aefa777943'
  checksum64     = '522596e26337418450bc5fb71535986504e0171e1e09efe17a8ea8c494b61622'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
