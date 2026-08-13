$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.1.0/croc_v11.1.0_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.1.0/croc_v11.1.0_Windows-64bit.zip'
  checksum       = '5cae139bf952c569a06fa9b1d46e1cf037bbe8f7705d7f2a380ea9477f152299'
  checksum64     = '77137314aa15eb194158acd4825534e6a1465f17f7e974411b3eea416b178eaa'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
