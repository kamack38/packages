$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2025-11-20_03/TcNo.Account.Switcher.-.Installer_2025-11-20_03.exe'
  checksum       = 'c0f49c6e401ee3ed8e0f799bd342bda1bc97ef92d43e9fba95ed2cc42795904e'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
