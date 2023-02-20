$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.3/croc_9.6.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.3/croc_9.6.3_Windows-64bit.zip'
  checksum       = 'b6d4eb0030bf16cb3735cbe3e9dbcf19abc87ff20c2936e072092e242e7a8f3a'
  checksum64     = '4d2685978567fe9a6c89f820e7d5ca19ee8194824bd255f3c218a66a0cc5b753'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
