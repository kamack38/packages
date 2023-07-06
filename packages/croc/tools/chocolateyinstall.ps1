$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v9.6.5/croc_9.6.5_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v9.6.5/croc_9.6.5_Windows-64bit.zip'
  checksum       = '2533c18f54fae7f40e87951ef1fec5e94951a78304b46702b2c2d9c2285b9eee'
  checksum64     = '17923dfc923792c7d6eadf8a52ec43f1009e34645a8aaa01c757f8920dd58a77'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
