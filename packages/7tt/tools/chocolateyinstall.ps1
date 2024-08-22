$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://ramensoftware.com/downloads/7tt_setup.exe'
  checksum       = '1d144d8d909acdc149adeefd0434914dbc0c385aa45b70798927e1e564a2fcb3'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
