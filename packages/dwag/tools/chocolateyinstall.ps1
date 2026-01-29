$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  fileType64     = 'exe'
  url64bit       = 'https://github.com/8LWXpg/dwag/releases/download/v0.4.0/dwag-0.4.0-win-x64.zip'
  checksum64     = '4b730e77826e10662df1e210e45c305e7737c5057a65bf2f15c3e8cdf44c7304'
  checksumType64 = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
