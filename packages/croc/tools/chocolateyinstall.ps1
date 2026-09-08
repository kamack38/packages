$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/schollz/croc/releases/download/v11.5.1/croc_v11.5.1_Windows-32bit.zip'
  url64bit       = 'https://github.com/schollz/croc/releases/download/v11.5.1/croc_v11.5.1_Windows-64bit.zip'
  checksum       = '6f60fa353c492d620c86906157199e5ae5ab14b94ee0389b40adf2e569ef7ce6'
  checksum64     = '41b5e0b4b627b7f79b3262405708173ce4b488eedbc13f2569f8b54c2af9d1b1'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
