$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.15/croc_v9.6.15_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.15/croc_v9.6.15_Windows-64bit.zip'
  checksum       = '3f1ae0794ab004689fc66ba8f8050a31a1deae456952f4130be86e11cc4bace1'
  checksum64     = 'eb1331c36c28260faf8d1b45752e1b34127b5e39511b6bc63e91d864451e75dd'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
