$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  url          = 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe'
  checksum     = '0bdc1bf1724e6e265599895c5ef0f0104e4cbb2f8c373abba5ed2111ba77b8af'
  checksumType = 'sha256'
  silentArgs   = '--skip-to-install'
}

Install-ChocolateyPackage @packageArgs
