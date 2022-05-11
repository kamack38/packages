$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.5.0/shfmt_v3.5.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.5.0/shfmt_v3.5.0_windows_amd64.exe'
  checksum       = '473bdae00875e0a0156ed8ddf7968d6352ae86684ce8e801d676b1ef2f6ba0e2'
  checksum64     = 'da079a17319d83d7935ca799a13da98e9c637d9d46f174b07dd948e0d7d5eb3a'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
