$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = 'https://blitz-main.blitz.gg/Blitz-2.1.175.exe'
  checksum       = '54821893266cfabebf079082d8da0801309489a7424ec9e32c8d3165d50df504'
  checksumType   = 'sha256'
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
