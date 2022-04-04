Import-Module au

$releases = 'https://api.github.com/repos/safing/portmaster-packaging/releases'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name
    $ver = $tag.Replace('.', '-')
    $url = "https://updates.safing.io/windows_amd64/packages/portmaster-installer_${ver}.exe"

    return @{
        URL32   = $url
        Version = $tag.Replace('v', '')
    }
}

Update-Package -NoReadme
