$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.eune.exe'
  checksum     = '65094dfb80ac87513d2b67bafc72730e8c75ac16e29e651602ebadc0a2660794'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
