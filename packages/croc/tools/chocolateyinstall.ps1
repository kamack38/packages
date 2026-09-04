$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.4.0/croc_v11.4.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.4.0/croc_v11.4.0_Windows-64bit.zip'
  checksum       = '6182ab937152af0d5abdc95555543acc362e509f3166080f81aeed2e3701b9d7'
  checksum64     = '3e4c611a22ba6393e56874c223c094b81a8a053a86130ce0348cc1524609ce05'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
