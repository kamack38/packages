$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://ramensoftware.com/downloads/7tt_setup.exe'
  checksum       = '91ecd30356cdc1cf65d19034544648b3d40dab52de3d1de408aa48e5455fa6ea'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
