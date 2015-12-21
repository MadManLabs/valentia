﻿#Requires -Version 3.0

<#
.Synopsis
   Edit Valentia Config in Console
.DESCRIPTION
   Read config and edit in the console
.EXAMPLE
   Edit-ValentiaConfig
#>
function Edit-ValentiaConfig
{
    [CmdletBinding()]
    param
    (
        [parameter(mandatory = $false, position = 0)]
        [string]$configPath = (Join-Path $valentia.appdataconfig.root $valentia.appdataconfig.file),

        [parameter(mandatory = $false, position = 1)]
        [switch]$NoProfile
    )

    if (Test-Path $configPath)
    {
        if ($NoProfile)
        {
            PowerShell_ise.exe -File $configPath -NoProfile
        }
        else
        {
            PowerShell_ise.exe -File $configPath
        }
    }
    else
    {
        ("Could not found configuration file '{0}'." -f $configPath) | Write-ValentiaVerboseDebug
    }

}
