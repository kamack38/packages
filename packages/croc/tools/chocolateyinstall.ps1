$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.5.6/croc_9.5.6_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.5.6/croc_9.5.6_Windows-64bit.zip'
  checksum       = '993bea54bd9853d6c2ffc3511eb487fa8453c67fb504f2e4350e4ab26f744fc8'
  checksum64     = '5729f9311f7d299b7e41dd1e9b300c6bd24c6b2a3f32bc9d79bfea42f1d0ac5c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
