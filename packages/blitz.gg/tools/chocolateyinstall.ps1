$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-main.blitz.gg/Blitz-2.1.326.exe'
  checksum       = '7637c406b119a7faeb7959283d2219d89d66d9c2cb64873518c5dfeedc9eb737'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
