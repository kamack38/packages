$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.22.1/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = 'ed6cd8bb5fa3619822e44f5de02617762620e1cd53fa86d6c42bd4b42d5040c7'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
