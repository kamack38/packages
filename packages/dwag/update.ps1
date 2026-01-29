Import-Module au

$repo = '8LWXpg/dwag'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $releases = "https://api.github.com/repos/$repo/releases"

    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name
    $version = $tag.Replace('v', '')

    $file64 = "dwag-$($version)-win-x64.zip"
    $url64 = "https://github.com/$repo/releases/download/$tag/$file64"

    return @{
        URL64   = $url64
        Version = $tag.Replace('v', '')
    }
}

Update-Package -NoReadme -ChecksumFor 64
