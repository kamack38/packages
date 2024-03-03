$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.13/croc_v9.6.13_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.13/croc_v9.6.13_Windows-64bit.zip'
  checksum       = 'cd9e3065e94f2f0126906a0c52e07376fb3a25f6171e6439978fd0ab3159d6bc'
  checksum64     = '2f047565734511d644e98ae44c70043f7fd6001eab2b35819ff89c0364e05bf7'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
