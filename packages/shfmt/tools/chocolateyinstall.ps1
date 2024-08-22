$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.9.0/shfmt_v3.9.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.9.0/shfmt_v3.9.0_windows_amd64.exe'
  checksum       = '61ad0af789b3ed158f5d593d7ee3301318b7cba2d84c265d8c30af0837315f28'
  checksum64     = '4ea136134248ac8ebbf9103370ddcd951b515a9e9bfba903252f12fd067bb5e9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
