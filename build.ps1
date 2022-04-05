param(
    [ArgumentCompleter( {
            param ( $CommandName,
                $ParameterName,
                $WordToComplete,
                $CommandAst,
                $FakeBoundParameters )
            $packages = (Get-ChildItem -Directory -Path $PSScriptRoot\packages).Name
            $searchBlock = { $_ -like "$WordToComplete*" }
            $completion = $packages | Where-Object $searchBlock 
            return $completion
        })]
    [string]$PackageName,
    [switch]$p
)

if (!(Test-Path "$PSScriptRoot\dist\")) {
    mkdir "$PSScriptRoot\dist"
}

if ($PackageName -like "all") {
    $packages = Get-ChildItem -Path $PSScriptRoot\packages\

    foreach ($item in $packages) {
        if ((Get-ChildItem $item.FullName -Filter *.nuspec).Length -gt 0) {
            Write-Output "$($item.BaseName) is a chocolatey package"
            choco pack (Get-ChildItem $item.FullName -Filter *.nuspec).FullName --outdir (Join-Path $PSScriptRoot "dist")
        }
    }
}
else {
    $packagePath = "$PSScriptRoot\packages\$PackageName"
    if (Test-Path $packagePath) {
        choco pack "$packagePath\$packageName.nuspec" --outdir (Join-Path $PSScriptRoot "dist")
        
        if ($p -and $?) {
            $nupkg = Get-ChildItem -Path $PSScriptRoot\dist | Where-Object Name -match "$PackageName*"
            choco push $nupkg
        }
    }
    else {
        Write-Host "This package does not exists!" -ForegroundColor Red
    }
}
