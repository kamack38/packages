$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$nvmPath = Join-Path $env:ProgramData 'nvm'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'zip'
  url           = 'https://github.com/coreybutler/nvm-windows/releases/download/1.1.11/nvm-setup.zip'
  checksum      = ''
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
New-Item -Path "$toolsDir\nvm-setup.exe.ignore" -ItemType File
Start-Process $toolsDir\nvm-setup.exe -ArgumentList "/VERYSILENT /NOCIONS /DIR=$nvmPath"
