$ErrorActionPreference = 'Stop';

$version = $env:chocolateyPackageVersion
$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = 'https://github.com/o2sh/onefetch/releases/download/2.18.1/onefetch-win.tar.gz'
  checksum      = '1195987ea18b9ad350782250aaf99ff640fe0fa989a14853477581d261632db6'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $toolsDir -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $toolsDir
