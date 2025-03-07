$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.11.0/shfmt_v3.11.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.11.0/shfmt_v3.11.0_windows_amd64.exe'
  checksum       = 'facfb70de36cc3b15d59938fd840d6eaa8dc5446767f043265038a49eb719ec7'
  checksum64     = 'd11a0880588304496065110cb67ce2375cfcd5433e76dec505ce1fa21adf47cc'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
