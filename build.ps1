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

choco pack "$PSScriptRoot\packages\$PackageName\$PackageName.nuspec" --outputdirectory $PSScriptRoot\nupkgs

if ($p -and $?) {
    $nupkg = Get-ChildItem -Path $PSScriptRoot\nupkgs | Where-Object Name -match "$PackageName*"
    choco push $nupkg
}