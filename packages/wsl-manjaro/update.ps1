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
    $releases = "https://api.github.com/repos/$repo/releases"

    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name
    
    $version = "$($tag.Substring(0, 4)).$($tag.Substring(4,2)).$($tag.Substring(6,2))"

    $file64 = "ManjaroWSL.zip"
    $url64 = "https://github.com/$repo/releases/download/$tag/$file64"

    return @{
        URL32   = $url64
        Version = $version
    }
}

Update-Package -NoReadme
