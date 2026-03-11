$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.13.0/shfmt_v3.13.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.13.0/shfmt_v3.13.0_windows_amd64.exe'
  checksum       = 'f3e32b2a320a3053837add32803d7fb3b730d3f10b84a867d327a549ef068fa0'
  checksum64     = '62241aaf6b0ca236f8625d8892784b73fa67ad40bc677a1ad1a64ae395f6a7d5'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
