$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.3/croc_v10.4.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.3/croc_v10.4.3_Windows-64bit.zip'
  checksum       = 'ceb7f24d93662fe937013ce3537045f4aa2cc82803c09da2f46a36491cb142a2'
  checksum64     = '7d13d4871ceed35d62057df33e4f621fd6dbcb2e8cb5be0e754c20297efa15f8'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
