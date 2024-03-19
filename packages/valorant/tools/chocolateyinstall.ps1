$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe'
  checksum     = '04269554c0610e4fcee3a35a3d86705ea98239b38168c79037013382bed214e3'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
