$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.2/croc_v10.0.2_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.2/croc_v10.0.2_Windows-64bit.zip'
  checksum       = '1ca787c9e37b52d8fdad2cc0bb6f2470d3ba25944cb8db6d6075c9c05ae46bcb'
  checksum64     = '297f7813cb2e145c5ee913f938cfb83008db00fe5aca43fc41a70641f3abeaeb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
