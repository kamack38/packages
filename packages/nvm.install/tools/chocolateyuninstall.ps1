$ErrorActionPreference = 'Stop';

$packageName = 'nvm.install'
$packageSearch = "NVM for Windows*"
$fileType = 'exe'
$silentArgs = '/SILENT /SUPPRESSMSGBOXES'
$validExitCodes = @(0)

Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
    -ErrorAction:SilentlyContinue `
| Where-Object { $_.DisplayName -like $packageSearch } `
| ForEach-Object { Uninstall-ChocolateyPackage -PackageName "$packageName" `
        -FileType "$fileType" `
        -SilentArgs "$silentArgs" `
        -File $_.UninstallString.Replace('"', '') `
        -ValidExitCodes $validExitCodes }