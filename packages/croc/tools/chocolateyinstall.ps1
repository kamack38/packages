$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.12/croc_v10.0.12_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.12/croc_v10.0.12_Windows-64bit.zip'
  checksum       = '42400956a3ac63b6a18ed2eba9c0573264fa807e56cddf89288d7b5a979da40d'
  checksum64     = '652cd03e4806b4ef2c9c43a4470038b3755e48f12e338240039fffc236206b3a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
