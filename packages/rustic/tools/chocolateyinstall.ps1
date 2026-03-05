$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.11.1/rustic-v0.11.1-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.11.1/rustic-v0.11.1-x86_64-pc-windows-msvc.tar.gz'
  checksum       = 'ab02dab1a15b89ae26385eaa63d6d3dc23f7dbd7596bc37c0239f13fd82bb963'
  checksum64     = 'ab02dab1a15b89ae26385eaa63d6d3dc23f7dbd7596bc37c0239f13fd82bb963'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
