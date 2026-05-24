$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/latest/windows_amd64/packages/Portmaster_2.1.19_x64-setup.exe'
  checksum     = '0b227790294a499762305cb235067dc6793a829050ae4e7b0985cdd93835ddeb'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
