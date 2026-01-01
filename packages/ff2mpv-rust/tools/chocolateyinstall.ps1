$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$binaryPath = Join-Path $toolsDir 'ff2mpv-rust.exe'
$firefoxManifestPath = Join-Path $toolsDir "$packageName.json"
$chromeManifestPath = Join-Path $toolsDir "$packageName-chrome.json"

$downloadArgs = @{
  url            = 'https://github.com/ryze312/ff2mpv-rust/releases/download/1.1.7/ff2mpv-rust-x86_64-pc-windows-msvc.exe'
  fileName       = $binaryPath
  checksum       = '145B0E6F0BF933929D4610C4978D7822C191C66739C9282655FAD89301A0262A'
  checksumType   = 'sha256'
}

$firefoxManifest = @{
    name = 'ff2mpv'
    description = "ff2mpv's external manifest"
    path = $binaryPath
    type = 'stdio'
    allowed_extensions = @('ff2mpv@yossarian.net')
} | ConvertTo-Json -Depth 10

$chromeManifest = @{
    name = 'ff2mpv'
    description = "ff2mpv's external manifest"
    path = $binaryPath
    type = 'stdio'
    allowed_origins = @('chrome-extension://ephjcajbkgplkjmelpglennepbpmdpjg/')
} | ConvertTo-Json -Depth 10

# Create manifest
New-Item -ItemType Directory -Force -Path (Split-Path $manifestPath) | Out-Null
$firefoxManifest | Out-File -FilePath $firefoxManifestPath -Encoding UTF8
$chromeManifestPath | Out-File -FilePath $chromeManifestPath -Encoding UTF8

Get-WebFile @downloadArgs

# Add to registry
$firefoxRegPath = "HKLM:\Software\Mozilla\NativeMessagingHosts\ff2mpv"
$chromeRegPath = "HKLM:\SOFTWARE\Google\Chrome\NativeMessagingHosts\ff2mpv"
New-Item -Path $firefoxRegPath -Value $firefoxManifestPath -Force | Out-Null
New-Item -Path $chromeRegPath -Value $chromeManifestPath -Force | Out-Null
