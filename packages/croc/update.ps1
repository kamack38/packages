Import-Module au

$repo = 'schollz/croc'

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
    
    $version = $tag.Replace('v', '')

    $file64 = "croc_$version`_Windows-64bit.zip"
    $url64 = "https://github.com/$repo/releases/download/$tag/$file64"

    $file32 = "croc_$version`_Windows-32bit.zip"
    $url32 = "https://github.com/$repo/releases/download/$tag/$file32"


    return @{
        URL32   = $url32
        URL64   = $url64
        Version = $version.Replace('v', '')
    }
}

Update-Package -NoReadme
