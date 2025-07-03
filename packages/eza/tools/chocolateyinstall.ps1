$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.22.0/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = 'f2f033d4b65467c80410dd3387c44d5ec20f7aedb5b426b45de50fc873acd931'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
