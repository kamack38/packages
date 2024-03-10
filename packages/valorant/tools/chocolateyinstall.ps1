$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe'
  checksum     = '28e32df023ff8aab6cd6a00522d19edf39ea8bcbbe8c8f8eccfd3449a6144813'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
