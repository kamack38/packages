Import-Module au

$repo = 'sileshn/ManjaroWSL2'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $latest_release = "https://api.github.com/repos/$repo/releases/latest"

    $tag = (Invoke-WebRequest -Uri $latest_release -UseBasicParsing | ConvertFrom-Json).tag_name    

    $version = "$($tag.Substring(0, 4)).$($tag.Substring(4,2)).$($tag.Substring(6,2))"

    $file64 = "ManjaroWSL2.zip"
    $url64 = "https://github.com/$repo/releases/download/$tag/$file64"

    return @{
        URL32   = $url64
        Version = $version
    }
}

Update-Package -NoReadme
