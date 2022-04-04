$ErrorActionPreference = 'Stop'

$uninstalled = $false
$packageName = 'nvm'
$zipName = "nvm-noinstall.zip"
$nvm = (& where.exe $packageName)
$EnvVariableType = 'Machine'

$nvmPath = Split-Path $nvm

if (Test-Path $nvmPath) { Remove-Item $nvmPath -Force -Recurse }

Install-ChocolateyEnvironmentVariable -VariableName "NVM_HOME" -VariableValue $null -VariableType $EnvVariableType
Install-ChocolateyEnvironmentVariable -VariableName "NVM_SYMLINK" -VariableValue $null -VariableType $EnvVariableType

[regex] $PathsToRemove = "^(%NVM_HOME%|%NVM_SYMLINK%)"
$environmentPath = Get-EnvironmentVariable -Name 'PATH' -Scope $EnvVariableType -PreserveVariables
$environmentPath
[string[]]$newpath = ''
foreach ($path in $environmentPath.split(';')) {
    If (($path) -and ($path -notmatch $PathsToRemove)) {
        [string[]]$newpath += "$path"
        "$path added to `$newpath"
    }
    else {
        "Path to remove found: $path"
    }
}
$AssembledNewPath = ($newpath -join (';')).trimend(';')
$AssembledNewPath

Install-ChocolateyEnvironmentVariable -variableName 'PATH' -variableValue $AssembledNewPath -variableType $EnvVariableType
"Path with variables"
$newEnvironmentPath = Get-EnvironmentVariable -Name 'PATH' -Scope $EnvVariableType -PreserveVariables
"Path with values instead of variables"
$env:PATH

Uninstall-ChocolateyZipPackage $packageName $zipName

$uninstalled = $true
