$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.5.3/croc_v11.5.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.5.3/croc_v11.5.3_Windows-64bit.zip'
  checksum       = 'a5c4cb775d1a10833a8d8b7a3a3ab3e9d4e5c0501d3e9a72dccaed58d09e946f'
  checksum64     = 'b9163fb162523f3acaabf33de38797545b557bf470808c97758aa9f9ca16b859'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
