Import-Module au

$releases = 'https://github.com/7coil/DiscordForOffice/releases'

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
        Where-Object href -match "DiscordForOffice.exe" | 
        Select-Object -First 1 -expand href
     $url = 'https://github.com' + $url

    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    return @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -NoReadme
