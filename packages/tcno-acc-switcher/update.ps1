Import-Module au

$releases = 'https://github.com/TcNobo/TcNo-Acc-Switcher/releases/'

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
    Where-Object href -match "TcNo.Account.Switcher.-.*.exe" | 
    Select-Object -First 1 -expand href
    $url = 'https://github.com' + $url

    $ver = $url -split '/' | Select-Object -Last 1
    $version = $ver -replace "TcNo.Account.Switcher.-.Installer_" -replace ".exe" -replace '_', '.'

    Write-Host "$version"

    return @{
        URL32   = $url
        Version = $version -replace '-', '.'
    }
}

Update-Package -NoReadme
