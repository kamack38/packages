$ErrorActionPreference = 'Continue';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "Manjaro.exe"
$rootfsPath = Join-Path $toolsDir 'rootfs.tar.gz'

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://github.com/sileshn/ManjaroWSL2/releases/download/20260701/ManjaroWSL2.zip'
  checksum      = '9277ba61e2a2431c47e8f23e9044fc43558a5773d1150f1b897ffe8478edbfd5'
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
