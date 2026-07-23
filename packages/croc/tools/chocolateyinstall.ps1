$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.6.0/croc_v10.6.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.6.0/croc_v10.6.0_Windows-64bit.zip'
  checksum       = 'f02d087479c07c8f967dd0bf7b70b3a1bed81922275f63a1912562f22b2e6d88'
  checksum64     = 'deb664cc14436a68477e9209defb0059fbc73eeae5945b6c725866984acaddd4'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
