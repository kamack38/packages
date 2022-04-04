$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2022-03-29_00/TcNo.Account.Switcher.-.Installer_2022-03-29_00.exe'
  checksum       = 'fab73ac221758bba49c4920cae882ca20ba730f67312151586051ad217bc0d6d'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
