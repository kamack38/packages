$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.5.5/croc_v11.5.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.5.5/croc_v11.5.5_Windows-64bit.zip'
  checksum       = 'fd2190ccb38cb3372425d3b632fee0b412c4a55b42ec7bf5d117fecd577ba3f1'
  checksum64     = 'b7d266bcce9d88beb4dee9d4f7f174382c5688bbb78832f557f8fc11586f0b10'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
