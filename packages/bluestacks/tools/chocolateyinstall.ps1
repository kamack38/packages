$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://cdn3.bluestacks.com/downloads/windows/nxt/5.5.101.1001/65a19fda4a914e2ea8f266863149b658/BlueStacksMicroInstaller_5.5.101.1001_native.exe'
  checksum       = '7c3ddf39fab7d274a5cd7abd0eea5adb349959057eb015b070d1145704b5428c'
  checksumType   = 'sha256'
  silentArgs     = '-s'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
