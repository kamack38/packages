$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.23.0/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.23.0/tree-sitter-windows-x64.gz'
  checksum       = '2c415daef67511f1fd09f70fd6c9937e24d85db60f2de07fb22c674b71af1633'
  checksum64     = '2ccd83bea6d5a3f67fb3e2e6572a2032a1194b567d76be03c44619d3ca6d3ef0'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
