$ErrorActionPreference = 'Stop';

$packageName     = $env:chocolateyPackageName
$toolsDir        = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.eune.exe'
  checksum       = '7cc6ebb8b0db977028b84d31c7dd216b200c5b273c37f43bf3e66dc486d246f2'
  checksumType   = 'sha256'
  silentArgs     = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
