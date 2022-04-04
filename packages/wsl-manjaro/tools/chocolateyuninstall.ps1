$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "Manjaro.exe"

Invoke-Expression -Command "$exePath clean -y"