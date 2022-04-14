$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.4.3/shfmt_v3.4.3_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.4.3/shfmt_v3.4.3_windows_amd64.exe'
  checksum       = 'cfaa0b820cf5d70ae2ce2f8ae51607acfd6cb546b4dc9c1193a839337a2a2cc4'
  checksum64     = 'a6c317a68dddf8efa9fd87d985a807cf7ab2423871d390aac4d3775691565835'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
