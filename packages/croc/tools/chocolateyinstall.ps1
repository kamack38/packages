$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.2/croc_v10.4.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.2/croc_v10.4.2_Windows-64bit.zip'
  checksum       = 'ef395edd567cea676cb2e82ba8be446198f73e132c653fb55b2e80f956bc846b'
  checksum64     = 'aac93803a887b0f10891f68f57edbf496c7d034d3cc721f9fc6cc193d0165386'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
