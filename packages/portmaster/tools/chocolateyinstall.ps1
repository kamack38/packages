$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/latest/windows_amd64/packages/Portmaster_2.0.23_x64-setup.exe'
  checksum     = 'dac98a68a94e06dfda24c159e24aefe5cee3dff670b6862ce709c7e707ec60ce'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
