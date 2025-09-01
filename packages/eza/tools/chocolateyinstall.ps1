$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.23.1/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = 'b58d42b911ddb2d923bcbc986dedef8ad47f2192fb884a9230d4223e8d75622f'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
