$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.2/tree-sitter-windows-x86.gz'
  url64bit       = 'https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.2/tree-sitter-windows-x64.gz'
  checksum       = '33b78cc1c59b062293601b8af195856e7807327bc90f1f699d4ee1ea43022484'
  checksum64     = '9ad9a340d092aca8ccd5cc3fd2e9a841ec572b4e1f83a227ec3c2e7a9e55e56a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
