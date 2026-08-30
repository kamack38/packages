$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.3.6/croc_v11.3.6_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.3.6/croc_v11.3.6_Windows-64bit.zip'
  checksum       = '49d6132d4db1276d2facba4338c27b2b352d86507aed828cbabe6ca669d59f2d'
  checksum64     = 'ed22552d371d55a9e3c3b612b982484fa00adaff8fb32c3f19f36dbf8e248bbf'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
