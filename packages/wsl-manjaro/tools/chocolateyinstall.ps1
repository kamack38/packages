$ErrorActionPreference = 'Continue';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "Manjaro.exe"
$rootfsPath = Join-Path $toolsDir 'rootfs.tar.gz'

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://github.com/sileshn/ManjaroWSL2/releases/download/20230803/ManjaroWSL2.zip'
  checksum      = '4bfe61f71f2a67694613dc3d83a9fa3af5391a048b9ce6f8c88b9008871843ec'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir
}

$shortcutArgs = @{
  shortcutFilePath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Manjaro.lnk"
  targetPath       = $exePath
}

Install-ChocolateyZipPackage @packageArgs
Start-Process -FilePath $exePath

wsl --set-default-version 2

& $exePath isregd
if ($?) {
  Write-Warning 'ManjaroWsl is already registered'
  exit 1
}

Invoke-Expression -Command "$exePath install $rootfsPath"
if ($?) { Write-Error 'ManjaroWsl installation failed!'; exit 1 }

if (Get-Command wt.exe) {
  & $exePath config --default-term wt
}
Install-ChocolateyShortcut @shortcutArgs
