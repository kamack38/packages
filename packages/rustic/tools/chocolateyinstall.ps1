$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.12.0/rustic-v0.12.0-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.12.0/rustic-v0.12.0-x86_64-pc-windows-msvc.tar.gz'
  checksum       = '792bb1ecf32b9a01144f0316b5c1cb1e3e23fc20a8d9c2362e067d266e6ddfc9'
  checksum64     = '792bb1ecf32b9a01144f0316b5c1cb1e3e23fc20a8d9c2362e067d266e6ddfc9'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
