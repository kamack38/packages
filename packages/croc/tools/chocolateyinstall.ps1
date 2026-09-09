$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.5.2/croc_v11.5.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.5.2/croc_v11.5.2_Windows-64bit.zip'
  checksum       = '8262ca2e4508d8fd96c0866e322a17fc5c5405f0016676db2ff3a358cf987ff3'
  checksum64     = '31878a23577e6dbc564b55750835ee1374d4ba8b4202bb1fd9840f5b33ec67ca'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
