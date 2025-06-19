$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://github.com/eza-community/eza/releases/download/v0.21.3/eza.exe_x86_64-pc-windows-gnu.zip'
  checksum       = '496e2c77b8ab6441bc0480dc21f99b04afff6fdf1befc5858f70a4d5eca4bc05'
  checksumType   = 'sha256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
