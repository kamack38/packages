Import-Module au

$repo = 'mvdan/sh'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $releases = "https://api.github.com/repos/$repo/releases"

    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name
    
    $file64 = "shfmt_$($tag)_windows_amd64.exe"
    $url64 = "https://github.com/$repo/releases/download/$tag/$file64"

    $file32 = "shfmt_$($tag)_windows_386.exe"
    $url32 = "https://github.com/$repo/releases/download/$tag/$file32"

    return @{
        URL32   = $url32
        URL64   = $url64
        Version = $tag.Replace('v', '')
    }
}

Update-Package -NoReadme
