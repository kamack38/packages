$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$location = Join-Path $toolsDir 'jarfix.exe'

$packageArgs = @{
  packageName  = $packageName
  fileType     = 'exe'
  fileFullPath = $location
  url          = 'https://johann.loefflmann.net/downloads/jarfix.exe'
  checksum     = '3A00C5B808954E9DCA76418506EACEC9CB1CB0FD844318A896EBAE787F5EAAE2'
  checksumType = 'sha256'
}

$shortcutArgs = @{
  shortcutFilePath = Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Jarfix.lnk"
  targetPath       = $location
}

Get-ChocolateyWebFile @packageArgs

Install-ChocolateyShortcut @shortcutArgs