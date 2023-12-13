$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_38_2_setup.exe'
  checksum       = '0bce6ea3711771b19539e7be84bb5a3d6a305beaae5f67c42859b580db592da6'
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
