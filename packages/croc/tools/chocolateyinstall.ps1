$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.13/croc_v10.4.13_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.13/croc_v10.4.13_Windows-64bit.zip'
  checksum       = '176dec4c67074688b0af2dcc2a9c9aa921860060e92f9750015703d70bab8ba5'
  checksum64     = 'abd6357f03fec4c0cb1e7de4d671a7ea6a70c6d03b436416603d8daefc5a613b'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
