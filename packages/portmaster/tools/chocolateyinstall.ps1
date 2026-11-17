$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/latest/windows_amd64/packages/Portmaster_2.2.9_x64-setup.exe'
  checksum     = '3e94e1dd7c7efb2533e9d240103e041ce0a6098fdc567c2d90bd648f2ebddbd3'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
