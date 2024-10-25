$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-main.blitz.gg/Blitz-2.1.222.exe'
  checksum       = '170e491fc4525903110fcb43f5892b117f21fd77f1f30ffa16c945a149aa76e1'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
