$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.2.1/croc_v11.2.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.2.1/croc_v11.2.1_Windows-64bit.zip'
  checksum       = '6b1806140841eb8c35c69bec93a48062581a474a0c7a62c0402518f2ffada316'
  checksum64     = '54b444ea48cc0cd521d63c05b893530b8173f2ae14eedd79e915a56dd19c20f8'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
