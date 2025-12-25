$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://ramensoftware.com/downloads/7tt_setup.exe'
  checksum       = '86e361f13f5394724a984e19e2534682de9575a021ebd1f1683455e8a37b57fc'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
