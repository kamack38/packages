$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://github.com/ramensoftware/windhawk/releases/download/v1.4/windhawk_setup.exe'
  checksum     = 'aa5417fb02abf9ae9f470caead6e832c3633b5afef83e38ee9bd85d49277282e'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

$pp = Get-PackageParameters

if ($pp.Portable) { $packageArgs.silentArgs += ' /PORTABLE' }
else { $packageArgs.silentArgs += ' /STANDARD' }

Install-ChocolateyPackage @packageArgs
