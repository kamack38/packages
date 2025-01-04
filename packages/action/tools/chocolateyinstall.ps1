$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_44_0_setup.exe'
  checksum       = '171f24eca8a5329c333c6593d268d1565ad8b2dd523939dfd5c36c8d7409485b'
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
