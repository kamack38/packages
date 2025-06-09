Import-Module au

$repo = 'eza-community/eza'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $releases = "https://api.github.com/repos/$repo/releases"

    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name

    $file32 = "eza.exe_x86_64-pc-windows-gnu.zip"
    $url32 = "https://github.com/$repo/releases/download/$tag/$file32"

    return @{
        URL32   = $url32
        Version = $tag.Replace('v', '')
    }
}

Update-Package -NoReadme
