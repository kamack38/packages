$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.14.1/shfmt_v3.14.1_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.14.1/shfmt_v3.14.1_windows_amd64.exe'
  checksum       = 'b6f171113e7359f44d5ffdc93a90b93a7d405aa8847129a6982e10fe4d356f1e'
  checksum64     = '13629ce28442ca80b6b5a819f7574ab39e1c28c6e26734ca816c9714e04851df'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
