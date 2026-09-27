$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.5.4/croc_v11.5.4_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.5.4/croc_v11.5.4_Windows-64bit.zip'
  checksum       = 'db3650238ddd675a0c90104f329c9cb1579f31a2319485ef8dd5b30721954261'
  checksum64     = 'a75e1bac08948e21a8f02a39ca387b5b516dc91c00b6358e3c14b9726f1992b7'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
