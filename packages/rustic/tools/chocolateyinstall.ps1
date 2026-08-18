$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  fileType64     = 'exe'
  url            = 'https://github.com/rustic-rs/rustic/releases/download/v0.11.4/rustic-v0.11.4-x86_64-pc-windows-msvc.tar.gz'
  url64bit       = 'https://github.com/rustic-rs/rustic/releases/download/v0.11.4/rustic-v0.11.4-x86_64-pc-windows-msvc.tar.gz'
  checksum       = 'aa3586c2646da30965e099393c739a32526c27314cfaaf97af7f65aab1ec230a'
  checksum64     = 'aa3586c2646da30965e099393c739a32526c27314cfaaf97af7f65aab1ec230a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'rustic.exe')
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
