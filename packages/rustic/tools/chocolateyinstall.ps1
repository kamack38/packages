$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.10.3/rustic-v0.10.3-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.10.3/rustic-v0.10.3-x86_64-pc-windows-msvc.tar.gz'
  checksum       = '0ec5e1b42486949b7847aab300cdd9296fd119fd924d67fb1a4dd31a1d8e24f2'
  checksum64     = '0ec5e1b42486949b7847aab300cdd9296fd119fd924d67fb1a4dd31a1d8e24f2'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
