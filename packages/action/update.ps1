Import-Module au

$releases = 'https://mirillis.com/download-action'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url = $download_page.links | 
        Where-Object href -match "_setup.exe" | 
        Select-Object -First 1 -expand href

    $ver = $url -split '/' | Select-Object -Last 1
    $version = $ver -replace "action_" -replace "_setup.exe" -replace '_','.'

    return @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -NoReadme
