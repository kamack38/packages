
$ErrorActionPreference = 'Stop';

$packageName = 'nvm'
$nvm = (& where.exe $packageName)

& $nvm off
