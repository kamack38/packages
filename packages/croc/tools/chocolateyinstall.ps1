$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.2.2/croc_v10.2.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.2.2/croc_v10.2.2_Windows-64bit.zip'
  checksum       = '1b57425b5702f8af6ab138fb3b5402216d0892cf4369aa24340f9f6616ddd3d7'
  checksum64     = '97569bdd93adf19ccb5d6c2eb0912daa453f8f78d2f735fcbad34ee735296983'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
