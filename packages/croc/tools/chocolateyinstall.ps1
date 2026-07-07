$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.4.11/croc_v10.4.11_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.4.11/croc_v10.4.11_Windows-64bit.zip'
  checksum       = 'fd88bfbe9feab152b49c43fbb84b891776e9bf75950a72e8f65ba389ba124720'
  checksum64     = 'fecc899c0196f5a8345fa0dcdf4a599ee1fcca15b0f9bb90e3d960c44814918c'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
