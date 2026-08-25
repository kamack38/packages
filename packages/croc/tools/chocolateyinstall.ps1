$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.3.2/croc_v11.3.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.3.2/croc_v11.3.2_Windows-64bit.zip'
  checksum       = '26250116197f1ca9c6685ebf023478d125826097aaa96331d39aaad1070ad0b2'
  checksum64     = 'ece869a021e0e02edcbe9843f5c4e10cbd6e71e7513cf26bb52bc47d132e04b4'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
