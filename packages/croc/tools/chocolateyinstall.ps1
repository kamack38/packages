$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v10.3.1/croc_v10.3.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v10.3.1/croc_v10.3.1_Windows-64bit.zip'
  checksum       = 'ca6650e8b7a2383d66af88e59e5b37a44c5440dc3b1a2b11cfea65f9513c8b82'
  checksum64     = '005d563026de72ce703d10833354dd5fe952301a69d73d67f8004a19c42bfcb4'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
