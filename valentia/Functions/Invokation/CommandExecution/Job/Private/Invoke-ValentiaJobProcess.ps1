﻿#Requires -Version 3.0

#-- Private Module Job / Functions for Remote Execution --#

function Invoke-ValentiaJobProcess
{
    [CmdletBinding()]
    param
    (
        [parameter(mandatory = $false)]
        [string[]]$ComputerNames = $valentia.Result.DeployMembers,

        [parameter(mandatory = $false)]
        [scriptBlock]$ScriptToRun = $valentia.Result.ScriptTorun,

        [parameter(mandatory = $true)]
        [PSCredential]$Credential,

        [parameter(mandatory = $false)]
        [hashtable]$TaskParameter,

        [parameter(mandatory = $true)]
        [System.Management.Automation.Runspaces.AuthenticationMechanism]$Authentication,

        [parameter(mandatory = $true)]
        [bool]$UseSSL,

        [parameter(mandatory = $true)]
        [bool]$SkipException
    )

    # Splatting
    $param = @{
        ComputerNames   = $ComputerNames
        ScriptToRun     = $ScriptToRun
        Credential      = $Credential
        TaskParameter   = $TaskParameter
        Authentication  = $Authentication
        UseSSL          = $UseSSL
        SkipException   = $SkipException
        ErrorAction     = $ErrorActionPreference
    }

    # Run ScriptBlock as Sequence for each DeployMember
    Write-Verbose ("Execute command : {0}" -f $param.ScriptToRun)
    Write-Verbose ("Target Computers : '{0}'" -f ($param.ComputerNames -join ", "))

    # Executing job
    Invoke-ValentiaCommand @param  `
    | %{$valentia.Result.Result = New-Object 'System.Collections.Generic.List[PSCustomObject]'
    }{
        $valentia.Result.ErrorMessageDetail += $_.ErrorMessageDetail
        $valentia.Result.SuccessStatus += $_.SuccessStatus
        if ($_.host -ne $null)
        {
            $hash = [ordered]@{
                Hostname = $_.host
                Values    = $_.result
                Success  = $_.success
            }
            $valentia.Result.Result.Add([PSCustomObject]$hash)
        }

        if(!$quiet)
        {
            "Show result for host '{0}'" -f $_.host | Write-ValentiaVerboseDebug
            $_.result
        }
    }
}