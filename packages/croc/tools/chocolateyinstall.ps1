$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.6/croc_v10.0.6_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.6/croc_v10.0.6_Windows-64bit.zip'
  checksum       = 'ce421bd06bc5fffdb2e18cb5821eda06a08e185ad3694dfeb98ab2dce37ce66d'
  checksum64     = '81e44def7a1eb477f8f945a21622628133e1f78652e0a9931e57bbddf2bc458d'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
