$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.2.5/croc_v10.2.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.2.5/croc_v10.2.5_Windows-64bit.zip'
  checksum       = '9956407daac64047de0400378fc49669bbf8076846de7b136da3300d564c608b'
  checksum64     = '1fdf10fddae2822cc4751b7c7b63c5e3143c4e59e6bd5e9af48216a65b992073'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
