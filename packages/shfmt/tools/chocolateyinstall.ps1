$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.14.0/shfmt_v3.14.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.14.0/shfmt_v3.14.0_windows_amd64.exe'
  checksum       = '899d0944bb7d81564a72c0ad77acc2a1d56d5292f0535317e98b2361eba6aab3'
  checksum64     = '6738a3e155fbfec3bedc70962f9cd1610197587a43b5d7100f405239d8e11375'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
