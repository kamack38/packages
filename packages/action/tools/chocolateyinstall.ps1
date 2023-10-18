$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://downloads.mirillis.com/files/action_4_38_0_setup.exe'
  checksum       = '46d735c7e5cf96b28955df106daf47a8ec0d4ac169259c77a21bdbc8fa0ceb71'
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
