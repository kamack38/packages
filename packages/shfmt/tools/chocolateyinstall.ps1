$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.12.0/shfmt_v3.12.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.12.0/shfmt_v3.12.0_windows_amd64.exe'
  checksum       = '92c1ef0af344a10f2cefe3ce4bc6793ae8b3719ac08fc01802bbd8eae105e534'
  checksum64     = 'c8bda517ba1c640ce4a715c0fa665439ddbe4357ba5e9b77b0e51e70e2b9c94b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
