Import-Module au

$repo = '7coil/DiscordForOffice'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $latest_release = "https://api.github.com/repos/$repo/releases"

    $tag = (Invoke-WebRequest -Uri $latest_release -UseBasicParsing | ConvertFrom-Json)[0].tag_name    

    $file = "DiscordForOffice.exe" 
    $url = "https://github.com/$repo/releases/download/$tag/$file"

    return @{
        URL32   = $url
        Version = $tag
    }
}

Update-Package -NoReadme
