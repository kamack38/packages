#!/usr/bin/env pwsh
# AU Packages Template: https://github.com/majkinetor/au-packages-template

param([string[]] $Name, [string] $ForcedPackages, [string] $Root = (Join-Path $PSScriptRoot "packages"), [switch] $NoCheckChocoVersion = $false)

if (Test-Path $PSScriptRoot/update_vars.ps1) { . $PSScriptRoot/update_vars.ps1 }

if (!(Test-Path $PSScriptRoot/dist)) { mkdir $PSScriptRoot/dist }

$Options = [ordered]@{
    WhatIf              = $au_WhatIf                              # Whatif all packages
    Force               = $false                                  # Force all packages
    Timeout             = 100                                     # Connection timeout in seconds
    UpdateTimeout       = 1200                                    # Update timeout in seconds
    Threads             = 10                                      # Number of background jobs to use
    Push                = $Env:au_Push -eq 'true'                 # Push to chocolatey
    PushAll             = $true                                   # Allow to push multiple packages at once
    PluginPath          = ''                                      # Path to user plugins
    NoCheckChocoVersion = $NoCheckChocoVersion                                  # Check chocolatey package version
    IgnoreOn            = @(                                      # Error message parts to set the package ignore status
        'Could not create SSL/TLS secure channel'
        'Could not establish trust relationship'
        'The operation has timed out'
        'Internal Server Error'
        'Service Temporarily Unavailable'
    )
    RepeatOn            = @(                                      # Error message parts on which to repeat package updater
        'Could not create SSL/TLS secure channel'            # https://github.com/chocolatey/chocolatey-coreteampackages/issues/718
        'Could not establish trust relationship'             # -||-
        'Unable to connect'
        'The remote name could not be resolved'
        'Choco pack failed with exit code 1'                 # https://github.com/chocolatey/chocolatey-coreteampackages/issues/721
        'The operation has timed out'
        'Internal Server Error'
        'An exception occurred during a WebClient request'
        'remote session failed with an unexpected state'
    )
    #RepeatSleep   = 250                                     # How much to sleep between repeats in seconds, by default 0
    #RepeatCount   = 2                                       # How many times to repeat on errors, by default 1

    Report              = @{
        Type   = 'markdown'                                  # Report type: markdown or text
        Path   = "$PSScriptRoot\Update-AUPackages.md"        # Path where to save the report
        Params = @{                                          # Report parameters:
            Github_UserRepo = $Env:github_user_repo          # Markdown: shows user info in upper right corner
            NoAppVeyor      = $true                          # Markdown: do not show AppVeyor build shield
            UserMessage     = "[Ignored](#ignored) | [History](#update-history) | [Force Test](https://gist.github.com/$Env:gist_id_test) | [Releases](https://github.com/$Env:github_user_repo/tags)"       #  Markdown, Text: Custom user message to show
            NoIcons         = $false                         # Markdown: don't show icon
            IconSize        = 32                             # Markdown: icon size
            Title           = ''                             # Markdown, Text: TItle of the report, by default 'Update-AUPackages'
        }
    }

    GitReleases         = @{
        ApiToken    = $Env:github_api_key                    # Your github api key
        ReleaseType = 'package'                              # Either 1 release per date, or 1 release per package
    }

    ForcedPackages      = $ForcedPackages -split ' '
    BeforeEach          = {
        param($PackageName, $Options )

        $pattern = "^${PackageName}(?:\\(?<stream>[^:]+))?(?:\:(?<version>.+))?$"
        $p = $Options.ForcedPackages | Where-Object { $_ -match $pattern }
        if (!$p) { return }

        $global:au_Force = $true
        $global:au_IncludeStream = $Matches['stream']
        $global:au_Version = $Matches['version']
    }
    AfterEach           = {
        
    }
}

if ($ForcedPackages) { Write-Host "FORCED PACKAGES: $ForcedPackages" }
$global:au_Root = $Root                                      # Path to the AU packages
$global:info = updateall -Name $Name -Options $Options 

#Uncomment to fail the build on AppVeyor on any package error
#if ($global:info.error_count.total) { throw 'Errors during update' }
