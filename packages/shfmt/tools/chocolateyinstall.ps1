$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.7.0/shfmt_v3.7.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.7.0/shfmt_v3.7.0_windows_amd64.exe'
  checksum       = '8bd0422554dd6ce5e07d9d17d020d89254b5c056009005df824e39a8cbdcf6aa'
  checksum64     = '2807b4af91fbbd961b68716de06c044f1b4f897457fc89fba216e5e2e351c64f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
