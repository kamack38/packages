$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-main.blitz.gg/Blitz-2.1.169.exe'
  checksum       = 'a6945548b9bab5cff821063b38e55c0a4f0856bc8f1b0e29425df0e9d56c9946'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
