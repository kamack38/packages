$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.6.3/croc_v11.6.3_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.6.3/croc_v11.6.3_Windows-64bit.zip'
  checksum       = '5d981e55b9649280d34c65ee08d4889aef62140d21dc8604eb7f4250daaf0b60'
  checksum64     = '47b6c51aa4b4ae0370296926a33a0818338448ada38eb76519ad067932c61330'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
