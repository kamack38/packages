$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.11/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.11/tree-sitter-windows-x64.gz'
  checksum       = 'c5b0c37d2e9c98b52bd6b338b91e1b5f8872088dedd52e3f7fba5cec7811e6bf'
  checksum64     = '9d836a8c405ed50cea6b3410905576de3bff2b42ca12edc1e825ec86fe918a5f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
