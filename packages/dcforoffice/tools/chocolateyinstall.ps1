$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/7coil/DiscordForOffice/releases/download/1.2/DiscordForOffice.exe'
  checksum       = '847b0da2bc7e3b641ea2dc0052d35ef644727df076cdb207cafa919e80590127'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
