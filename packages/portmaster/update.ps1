Import-Module au

$releases = 'https://api.github.com/repos/safing/portmaster/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $tag = ((Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json) | Where-Object { $_.prerelease -eq $false })[0].tag_name
    $ver = $tag.Replace('v', '')
    $url = "https://updates.safing.io/latest/windows_amd64/packages/Portmaster_${ver}_x64-setup.exe"

    return @{
        URL32   = $url
        Version = $ver
    }
}

Update-Package -NoReadme
