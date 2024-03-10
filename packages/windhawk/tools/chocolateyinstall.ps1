$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://github.com/ramensoftware/windhawk/releases/download/v1.4.1/windhawk_setup.exe'
  checksum     = '85dbfda445ba4b23c167e9c3767fb812366642c6f40d3b4d1ba00040595cec30'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

$pp = Get-PackageParameters

if ($pp.Portable) { $packageArgs.silentArgs += ' /PORTABLE' }
else { $packageArgs.silentArgs += ' /STANDARD' }

Install-ChocolateyPackage @packageArgs
