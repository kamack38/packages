$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe'
  checksum     = 'ea369392bddd90c16755b8e88817ac60785480bfca5955ad180b6adcd6e4db8a'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
