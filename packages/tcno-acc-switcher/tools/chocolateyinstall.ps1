$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2023-06-27_01/TcNo.Account.Switcher.-.Installer_2023-06-27_01.exe'
  checksum       = 'c41c79352f479a9ae1f29ac9871ccddd880bb394bdf1b32f37b3826db267532d'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
