$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://github.com/ramensoftware/windhawk/releases/download/v1.6.1/windhawk_setup.exe'
  checksum     = 'a37f8d5be2216f55c9c624fed32272b6baab68a67c2b8c2f5f1d5e86b889d244'
  checksumType = 'sha256'
  silentArgs   = '/S'
}

$pp = Get-PackageParameters

if ($pp.Portable) { $packageArgs.silentArgs += ' /PORTABLE' }
else { $packageArgs.silentArgs += ' /STANDARD' }

Install-ChocolateyPackage @packageArgs
