$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName    = $packageName
  url            = 'https://github.com/mvdan/sh/releases/download/v3.8.0/shfmt_v3.8.0_windows_386.exe'
  url64bit       = 'https://github.com/mvdan/sh/releases/download/v3.8.0/shfmt_v3.8.0_windows_amd64.exe'
  checksum       = '7bca75d21d99a256b79db258c8e6411a99b6f6a990c937663621650cec95ede2'
  checksum64     = '91230a6d2d4dbb52e9c0bb134acba526f7880bfd3dfd1ffdde66e9f393d7a646'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  fileFullPath   = (Join-Path $toolsDir 'shfmt.exe')
}

Get-ChocolateyWebFile @packageArgs
