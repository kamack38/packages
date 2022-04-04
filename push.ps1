param(
    [ArgumentCompleter( {
            param ( $CommandName,
                $ParameterName,
                $WordToComplete,
                $CommandAst,
                $FakeBoundParameters )
            $packages = (Get-ChildItem -Path $PSScriptRoot\nupkgs).Name
            $searchBlock = { $_ -like "$WordToComplete*" }
            $completion = $packages | Where-Object $searchBlock 
            return $completion
        })]
    [string]$PackageName,
    [switch]$p
)

choco push "$PSScriptRoot\nupkgs\$PackageName"