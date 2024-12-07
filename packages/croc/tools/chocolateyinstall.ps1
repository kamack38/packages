$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.1.3/croc_v10.1.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.1.3/croc_v10.1.3_Windows-64bit.zip'
  checksum       = '546c3dfd281f8f06aaf64a0fedc31096e2af287e2fbaeffd4c431ed6a6c4d28a'
  checksum64     = '804201a4515437b3b24ffddc8aaa16cbd0640b4279237e0b162ea3e44c79e67f'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
