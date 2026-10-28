$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/latest/windows_amd64/packages/Portmaster_2.2.8_x64-setup.exe'
  checksum     = '461370a8bfd961ce197f926e9675860a19c333082f39ac8153582734563a8d21'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
