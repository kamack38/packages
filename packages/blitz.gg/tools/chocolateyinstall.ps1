$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-stable.blitz.gg/Blitz-1.17.4.exe'
  checksum       = '543b52c1a28ff74f9640dc62ef38c3a130ea84c0b8726f1ccc8a5a9c547fd35c'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
