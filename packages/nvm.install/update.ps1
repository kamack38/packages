Import-Module au

$repo = 'coreybutler/nvm-windows'
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
   $latest_release = "https://api.github.com/repos/$repo/releases/latest"

    $tag = (Invoke-WebRequest -Uri $latest_release -UseBasicParsing | ConvertFrom-Json).tag_name    

    $file = "nvm-setup.zip" 
    $url = "https://github.com/$repo/releases/download/$tag/$file"

    return @{
        URL32   = $url
        Version = $tag.Replace('v', '')
    }
}

Update-Package -NoReadme
