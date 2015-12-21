#Requires -Version 3.0

#-- Public Functions for CredSSP Configuration --#

function Add-ValentiaCredSSPDelegateRegKeyProperty
{
    [CmdletBinding()]
    param
    (
        [Parameter(Position = 0, mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$Keys = $valentia.credssp.AllowFreshCredentialsWhenNTLMOnly.Key,

        [Parameter(Position = 1, mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$regValue = $valentia.credssp.AllowFreshCredentialsWhenNTLMOnly.Value
    )

    $ErrorActionPreference = $valentia.preference.ErrorActionPreference.custom
    Set-StrictMode -Version latest

    $param = @{
        Path  = $keys
        Value = $regValue
        Force = $true
    }

    $result = Get-ValentiaCredSSPDelegateRegKeyProperty -Keys $Keys
    if ($result.Value -notcontains $regValue)
    {
        $max = ($result.Key | measure -Maximum).Maximum
        $max++
        New-ItemProperty @param -Name $max
    }
    elseif ($null -eq $result.Key)
    {
        New-ItemProperty @param -Name 1
    }
}