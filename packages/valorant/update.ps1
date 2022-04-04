Import-Module au

$releases = 'https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $f = New-TemporaryFile
    Invoke-WebRequest $releases -OutFile $f
    $version = (Get-ChildItem $f.FullName).VersionInfo.FileVersion
    Remove-Item $f.FullName
    return @{
        Version = $version
    }
}

Update-Package -NoReadme
