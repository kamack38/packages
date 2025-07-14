$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.8/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.8/tree-sitter-windows-x64.gz'
  checksum       = '93c1ba60e599589e4e0e921ebc258196d4797b732b25a067cd482ffaa14e620e'
  checksum64     = '531cebb2c7c7e3c11dfa42ba8e1ac79632364dfe44fda9d0c15228ae68f43bbe'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
