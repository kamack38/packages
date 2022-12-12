$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.6.0/shfmt_v3.6.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.6.0/shfmt_v3.6.0_windows_amd64.exe'
  checksum       = '3753abfaca1beaf80a81e084c7947e60e2a08076270950d76197f4997fc122d0'
  checksum64     = '18122d910ba434be366588f37c302c309cde4ca5403f93285254a3cf96839d01'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
