$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_windows_amd64.exe'
  checksum       = '50df493c1ac1d849bb0acaf7c88b4a3cc79b0e13bce801c917a305599245c345'
  checksum64     = 'f759493bc55a4ea181442eb7d79b527ff6c15d62ec567b8b86a5df6a086c9c46'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
