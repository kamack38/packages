$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.5.2/croc_9.5.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.5.2/croc_9.5.2_Windows-64bit.zip'
  checksum       = '07e3b621d575b4fc1af8ee0bf2f7f6c756bdf62dec92e54b525d4c3b46601146'
  checksum64     = '24a32b469471cbf4a864ae4b2ca6c7f11168cde6fb27511e938cd61e0bdc9b20'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
