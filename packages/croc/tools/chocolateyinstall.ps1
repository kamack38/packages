$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.0.3/croc_v10.0.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.0.3/croc_v10.0.3_Windows-64bit.zip'
  checksum       = '3bee11d694a1111b89f5fdb89af0479ef294819122cb592bc7388af31a153e8c'
  checksum64     = '100124ed2b91f4b7b543dccfed2277eea2938a4e9be794a3b58c0dca853ed8bb'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
