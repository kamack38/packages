Import-Module au

$releases = 'https://github.com/coreybutler/nvm-windows/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url = $download_page.links | 
    Where-Object href -match "nvm-noinstall.zip" | 
    Select-Object -First 1 -expand href
    $url = 'https://github.com' + $url

    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    return @{
        URL32   = $url
        Version = $version.Replace('v', '')
    }
}

Update-Package -NoReadme
