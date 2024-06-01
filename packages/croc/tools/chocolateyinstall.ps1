﻿$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.7/croc_v10.0.7_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.7/croc_v10.0.7_Windows-64bit.zip'
  checksum       = '70ad530187e1afbc3337d82b26c65a2c45f282c35bd483d45e5cbf077b0a7c0c'
  checksum64     = '2147a6bee6c990eaee891913962e7214c430f4ac64a976cce6ce5c71355c873c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
