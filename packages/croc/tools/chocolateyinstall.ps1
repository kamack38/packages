$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.0.0/croc_v11.0.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.0.0/croc_v11.0.0_Windows-64bit.zip'
  checksum       = 'c1cd86b305437d560b0f62f77c1da2778deb73277468cc977949e658a3260799'
  checksum64     = 'b6fb240481d4a650932694c909bb266a891dec5979cf425bb87bce725f1859aa'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
