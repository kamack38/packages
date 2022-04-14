$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/windows_amd64/packages/portmaster-installer_v0-7-0.exe'
  checksum     = '2a7ea1568f83f5579c9921975a05aaf7e853bc29e5f5009d86ee8c1c27c5d336'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
