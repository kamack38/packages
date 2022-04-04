$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_27_0_setup.exe'
  checksum       = '9191ffacf066bc3c7e91ed7e6774132ecfe60ae841de5719caaee39eb638e137'
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
