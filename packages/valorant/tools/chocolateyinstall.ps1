$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe'
  checksum     = 'fc6b67dbf8051ade2ec099d433f882027cff9b30b17066f686a0e25f4e9c075a'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
