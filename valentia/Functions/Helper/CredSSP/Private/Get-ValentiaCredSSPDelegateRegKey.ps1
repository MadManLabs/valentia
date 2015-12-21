#Requires -Version 3.0

#-- Public Functions for CredSSP Configuration --#

function Get-ValentiaCredSSPDelegateRegKey
{
    [CmdletBinding()]
    param
    (
        [Parameter(Position = 0, mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$Keys = $valentia.credssp.AllowFreshCredentialsWhenNTLMOnly.Key
    )

    $ErrorActionPreference = $valentia.preference.ErrorActionPreference.custom
    Set-StrictMode -Version latest

    $path = (Split-Path $keys -Parent)
    $name = (Split-Path $keys -Leaf)
    Get-ChildItem -Path $path `
    | %{
        $hashtable = @{
            Name    = $name
            PSPath  = $path
        }

        if ($_ | where name -eq $name)
        {
            $true
        }
        else
        {
            $false
        }
    }
}