$ErrorActionPreference = 'Continue';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "Manjaro.exe"
$rootfsPath = Join-Path $toolsDir 'rootfs.tar.gz'

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://github.com/sileshn/ManjaroWSL/releases/download/20220414/ManjaroWSL.zip'
  checksum      = 'ad260c56fcbb0c3a7d9603032ef948e5222395aea2df5fc0de5ee2325e9e4578'
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
