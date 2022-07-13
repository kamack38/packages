$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-stable.blitz.gg/Blitz-1.17.9.exe'
  checksum       = '769fb169a00f523aeea511bd8fc036f75daf1f5dde41d99d1a6f325ba62d3e7d'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
