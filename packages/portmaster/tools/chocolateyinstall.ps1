$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://updates.safing.io/windows_amd64/packages/portmaster-installer_v0-8-8.exe'
  checksum     = 'b0c03a122b27165af162a071e51d3997059083715cdb056df62b68acb88280b4'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
