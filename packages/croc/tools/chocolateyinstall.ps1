$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.3.5/croc_v11.3.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.3.5/croc_v11.3.5_Windows-64bit.zip'
  checksum       = 'f8a6f1982c1ee72f292e769f5e6d1179fbdaddc8c19a763c5aa1704564bade63'
  checksum64     = '864856c89992fe3392146ab6218baf7ffad9d194c39abd5cb579d897bcca1bed'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
