$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2022-04-29_00/TcNo.Account.Switcher.-.Installer_2022-04-29_00.exe'
  checksum       = '89eafabb470b4b78014d697743976042e93ba41718e2ade1ba76b9ef50241eb6'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
