$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.9/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.9/tree-sitter-windows-x64.gz'
  checksum       = '154b0fe47b3ca1345b39a4caf7c5fc504f0c63b669cbe6959c19d7dd3786403f'
  checksum64     = 'dbb5309fcc76eaeb4ec358fcb72ac2eae5cd653e12967246cc63f84038d16cd8'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
