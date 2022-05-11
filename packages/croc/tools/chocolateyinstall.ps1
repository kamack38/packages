$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.5.5/croc_9.5.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.5.5/croc_9.5.5_Windows-64bit.zip'
  checksum       = '6cbc3249013ca8c27173a78e3ba1a2c2492fa74b5e6344f114c4dbcdea6390df'
  checksum64     = 'f3da2f17d98e6b8079e345c4db7dd410cd59f6f2beab6c4cc92791028ca446ff'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
