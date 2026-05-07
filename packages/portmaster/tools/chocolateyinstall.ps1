$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/latest/windows_amd64/packages/Portmaster_2.1.18_x64-setup.exe'
  checksum     = '5eb191e4f81f419454c263f3e02822e9404d8582e0abe986969e6353a0d3d1d1'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
