$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://ramensoftware.com/downloads/7tt_setup.exe'
  checksum       = 'a010f23a4d41e590093a9419c17769680cf302dcabed0237273a97e05b2ab67f'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
