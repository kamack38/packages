$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://ramensoftware.com/downloads/7tt_setup.exe'
  checksum       = '0e5e335f954dfa71b3393981741c1f9c2759bb13cc803d50d58f66dd81977aeb'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
