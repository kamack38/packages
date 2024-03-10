$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.21.0/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.21.0/tree-sitter-windows-x64.gz'
  checksum       = '17f734748c06951e34a5c9db7ad3cf71c81adfaa0e08d8151e460bceaaeaa5df'
  checksum64     = '46152125a9337d9ec0455329f4a13ae4a8f63bb32756a5a2ed8f50ca83a321ad'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
