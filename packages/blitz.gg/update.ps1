Import-Module au

$releases = 'https://blitz.gg/download/win'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $request = [System.Net.WebRequest]::Create($releases)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()
    $url = $response.GetResponseHeader("Location")
    $file = $url.split("/")[-1]
    $version = $file -replace "Blitz-" -replace ".exe"

    return @{
        URL32   = $url
        Version = $version
    }
}

Update-Package -NoReadme
