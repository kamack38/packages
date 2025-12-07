$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://github.com/ramensoftware/windhawk/releases/download/v1.7.1/windhawk_setup.exe'
  checksum     = '43a799cfd02ec07a835d3bb0b76a0d019622c4483aad11f7a87a622fdf22363c'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

$pp = Get-PackageParameters

if ($pp.Portable) { $packageArgs.silentArgs += ' /PORTABLE' }
else { $packageArgs.silentArgs += ' /STANDARD' }

Install-ChocolateyPackage @packageArgs
