$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.5.0/croc_v10.5.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.5.0/croc_v10.5.0_Windows-64bit.zip'
  checksum       = 'e0d9500ffb1eb7d1f692acb50f84de9ce88694fa508d99f10a8bfbe7a5cd98d0'
  checksum64     = 'd2aed7b574c1c376792d5ddd2776e979f1c60cb90e72b9a345d86d7b31c56f76'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
