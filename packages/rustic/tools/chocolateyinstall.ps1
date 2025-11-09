$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.10.1/rustic-v0.10.1-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.10.1/rustic-v0.10.1-x86_64-pc-windows-msvc.tar.gz'
  checksum       = 'a5cc805236eb69a2f7ec5cf7b0f0797937b692bd3c4e07b665fab42b7100a88a'
  checksum64     = 'a5cc805236eb69a2f7ec5cf7b0f0797937b692bd3c4e07b665fab42b7100a88a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
