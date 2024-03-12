$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.14/croc_v9.6.14_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.14/croc_v9.6.14_Windows-64bit.zip'
  checksum       = '613c22eb4de89dfd04743ddfde15fd5200d086381928a51bb44857be9632ae14'
  checksum64     = 'fbf6d5a9247b3b94aa1cac4544b494e778d9aba337bb9f565d55564f9370d673'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
