$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2024-08-25_00/TcNo.Account.Switcher.-.Installer_2024-08-25_00.exe'
  checksum       = 'fa892fef377bee995bc470e4d0e2a1d8b87ddcccc4ff6400620c126f84685ba5'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
