$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2025-11-09_00/TcNo.Account.Switcher.-.Installer_2025-11-09_00.exe'
  checksum       = '7630c8a9f5437379a47e59b86677a8110124c3840476bd9643f04ef116319b6b'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
