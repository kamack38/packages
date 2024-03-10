$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.eune.exe'
  checksum     = 'fba921a3e4c7e67d4bef1cac5fbdc72b9f29973a55e6735f7dd94b5bf6b06ff0'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
