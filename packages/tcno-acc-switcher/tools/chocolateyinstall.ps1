$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/download/2022-05-26_01/TcNo.Account.Switcher.-.Installer_2022-05-26_01.exe'
  checksum       = '58870e083faf220f2e6c548c32c3739c21353cdc7bffc016d56f495631e37bf1'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
