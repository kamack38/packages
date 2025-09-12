$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.10.0/rustic-v0.10.0-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.10.0/rustic-v0.10.0-x86_64-pc-windows-msvc.tar.gz'
  checksum       = '95262fa775c14556c5f63b4b6d0b99113c54b0504ab067b4227ff51236d7d8cb'
  checksum64     = '95262fa775c14556c5f63b4b6d0b99113c54b0504ab067b4227ff51236d7d8cb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
