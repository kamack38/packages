Import-Module au

$releases = 'https://cloud.bluestacks.com/api/getdownloadnow?platform=win'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -Uri $releases -MaximumRedirection 0 -UseBasicParsing -SkipHttpErrorCheck -ErrorAction:SilentlyContinue
    $url = $response.Headers.Location.Split('?')[0]

    $version = $url.Split('_')[1]

    return @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -NoReadme
