$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.10.0/shfmt_v3.10.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.10.0/shfmt_v3.10.0_windows_amd64.exe'
  checksum       = '695d43b600103d8e8beb7460764f43da1d679576e67130012507a38238ef7dbd'
  checksum64     = '6e4c6acd38de7b4b1ba8f8082b9e688df8c9b861d3f8b2e7bb1b7270201a3587'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
