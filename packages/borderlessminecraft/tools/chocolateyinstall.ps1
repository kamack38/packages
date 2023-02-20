$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$location = Join-Path $toolsDir 'BorderlessMinecraft.exe'

$packageArgs = @{
  packageName  = $packageName
  url          = 'https://github.com/Mr-Technician/BorderlessMinecraft/releases/download/v1.3.4/BorderlessMinecraft.exe'
  checksum     = 'b69f7eeff60c8149032a4b139ab4da831f837dcfeac480ce40972d7f620bc8d3'
  checksumType = 'sha256'
  fileFullPath = $location
}

$shortcutArgs = @{
  shortcutFilePath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\BorderlessMinecraft.lnk"
  targetPath       = $location
}

Get-ChocolateyWebFile @packageArgs

Install-ChocolateyShortcut @shortcutArgs
