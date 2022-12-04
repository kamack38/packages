
$ErrorActionPreference = "Stop"

$packageName = 'nvm'

$nodePath = "$env:SystemDrive\Program Files\nodejs"
$nvmPath = Join-Path $env:ProgramData $packageName
$OsBits = Get-ProcessorBits
$NvmSettingsFile = Join-Path $nvmPath "settings.txt"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $nvmPath
  url           = 'https://github.com/coreybutler/nvm-windows/releases/download/1.1.10/nvm-noinstall.zip'
  checksum      = '81e651ec6d848075d557cca929af682f63a77d4fab44c202f25a20c0aba33749'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$NvmSettingsDict = [ordered]@{}
if (Test-Path $NvmSettingsFile) {
  $NvmSettings = Get-Content $NvmSettingsFile
  $NvmSettings | Foreach-Object { $NvmSettingsDict.add($_.split(':', 2)[0], $_.split(':', 2)[1]) }
  Write-Output "Detected existing settings file"
  $NvmSettingsDict.GetEnumerator() | ForEach-Object { "$($_.Name): $($_.Value)" } | Write-Verbose
}
if (!($NvmSettingsDict['root'])) { $NvmSettingsDict['root'] = $nvmPath }
if (!($NvmSettingsDict['path'])) { $NvmSettingsDict['path'] = $nodePath }
if (!($NvmSettingsDict['arch'])) { $NvmSettingsDict['arch'] = $OsBits }
if (!($NvmSettingsDict['proxy'])) { $NvmSettingsDict['proxy'] = "none" }

$NvmSettingsDict.GetEnumerator() | ForEach-Object { "$($_.Name): $($_.Value)" } | Write-Verbose
$NvmSettingsDict.GetEnumerator() | ForEach-Object { "$($_.Name): $($_.Value)" } | Out-File "$NvmSettingsFile" -Force -Encoding ascii

Install-ChocolateyEnvironmentVariable -VariableName "NVM_HOME" -VariableValue "$nvmPath" -VariableType Machine;
Install-ChocolateyEnvironmentVariable -VariableName "NVM_SYMLINK" -VariableValue "$nodePath" -VariableType Machine;

Install-ChocolateyPath -PathToInstall "%NVM_HOME%" -PathType Machine;

Install-ChocolateyPath -PathToInstall "%NVM_SYMLINK%" -PathType Machine;
