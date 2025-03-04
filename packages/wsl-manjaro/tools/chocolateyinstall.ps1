$ErrorActionPreference = 'Continue';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "Manjaro.exe"
$rootfsPath = Join-Path $toolsDir 'rootfs.tar.gz'

$packageArgs = @{
  packageName   = $packageName
  url           = 'https://github.com/sileshn/ManjaroWSL2/releases/download/20250304/ManjaroWSL2.zip'
  checksum      = 'b127b75743dcfe41831ab6da098bab8cae89ceb86c7bdce18b95a5634c073e43'
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
