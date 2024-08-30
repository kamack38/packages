$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2024-08-30_01/TcNo.Account.Switcher.-.Installer_2024-08-30_01.exe'
  checksum       = '7a652996964da23dd3fec4071057accf04ff2489b4480e58a5f0610c7c9df534'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
