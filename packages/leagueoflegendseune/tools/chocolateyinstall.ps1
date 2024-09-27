$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.eune.exe'
  checksum     = 'd472d20e19572f67e5d36e3fc8b67243d84e5bb00f0c190ca6ad1aba723b0f13'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
