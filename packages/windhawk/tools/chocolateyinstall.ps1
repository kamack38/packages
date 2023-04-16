$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://github.com/ramensoftware/windhawk/releases/download/v1.3.1/windhawk_setup.exe'
  checksum     = 'fb1ecc8b6eeebda10fa06c1c5dce004e53ff17288929c0e77a0daaa384d2edf4'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

$pp = Get-PackageParameters

if ($pp.Portable) { $packageArgs.silentArgs += ' /PORTABLE' }
else { $packageArgs.silentArgs += ' /STANDARD' }

Install-ChocolateyPackage @packageArgs
