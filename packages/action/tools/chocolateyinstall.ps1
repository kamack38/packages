$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_35_0_setup.exe'
  checksum       = 'c271cd34b958e1c90f2c2cba9d05d3cc276e229452d424cba9acf904b2423f10'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

$pp = Get-PackageParameters

if ($pp.NoDesktopIcon) { $packageArgs.silentArgs += ' /ND' }
if ($pp.NoStartMenuIcon) { $packageArgs.silentArgs += ' /NS' }
# Doesn't work
# if ($pp.Path) {
#   $installPath = $pp.Path
#   packageArgs.silentArgs += " /D=$installPath" 
# }

Install-ChocolateyPackage @packageArgs
