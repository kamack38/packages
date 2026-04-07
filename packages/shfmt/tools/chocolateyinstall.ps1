$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.13.1/shfmt_v3.13.1_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.13.1/shfmt_v3.13.1_windows_amd64.exe'
  checksum       = '9b4f368b837feb883a3b2bf38a46a94dcab4bca4b7c3e19f6710e0e09a56ce7c'
  checksum64     = '60cd368533d0ad73fa86d93d5bbf95ef40587245ce684ed138c1b31557b5fe97'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
