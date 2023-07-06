$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2023-07-05_00/TcNo.Account.Switcher.-.Installer_2023-07-05_00.exe'
  checksum       = '0080e116f43a86642c58e0fb57bf912035c1e25f9a16b4e9d7559cf26e502f94'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
