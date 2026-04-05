$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.11.2/rustic-v0.11.2-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.11.2/rustic-v0.11.2-x86_64-pc-windows-msvc.tar.gz'
  checksum       = '6bf1052f5ac2b48f7124273526ce87784a970ebbe2463b0bfa3dae0a5f3613ff'
  checksum64     = '6bf1052f5ac2b48f7124273526ce87784a970ebbe2463b0bfa3dae0a5f3613ff'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
