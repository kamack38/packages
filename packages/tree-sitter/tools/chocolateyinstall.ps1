$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.4/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.24.4/tree-sitter-windows-x64.gz'
  checksum       = 'c37751772068649cb9682c883d8bd15de1ad42d66926a88ca819cd5929edd357'
  checksum64     = '1fa29eb05f82b1d473e14ecce83b6204671765807d096fe5cea1ccd8cfa90c5b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
