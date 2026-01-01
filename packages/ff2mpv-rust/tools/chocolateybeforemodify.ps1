$ErrorActionPreference = 'Stop'
$regPath = "HKLM:\Software\Mozilla\NativeMessagingHosts\$packageName"

$regPaths = @(
    "HKLM:\Software\Mozilla\NativeMessagingHosts\ff2mpv",
    "HKLM:\SOFTWARE\Google\Chrome\NativeMessagingHosts\ff2mpv"
)
foreach ($regPath in $regPaths) {
    if (Test-Path $regPath) { Remove-Item $regPath -Recurse }
}
