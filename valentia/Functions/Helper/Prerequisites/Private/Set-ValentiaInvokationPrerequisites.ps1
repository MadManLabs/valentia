﻿#Requires -Version 3.0

#-- Helper for valentia Invokation Prerequisite setup--#

function Set-ValentiaInvokationPrerequisites
{
    [CmdletBinding()]
    param
    (
        [parameter(mandatory = $true)]
        [System.Diagnostics.Stopwatch]$StopWatch,

        [Parameter(Position = 0, mandatory = $true)]
        [string[]]$DeployGroups,

        [Parameter(Position = 1, mandatory = $false)]
        [string]$TaskFileName,

        [Parameter(Position = 2, mandatory = $false)]
        [ScriptBlock]$ScriptBlock,

        [Parameter(Position = 3, mandatory = $false)]
        [string]$DeployFolder,

        [Parameter(Position = 4, mandatory = $false)]
        [string[]]$TaskParameter
    )
    
    # clear previous result
    Invoke-ValentiaCleanResult

    # Initialize Error status
    $valentia.Result.SuccessStatus = $valentia.Result.ErrorMessageDetail = @()

    # Get Start Time
    $valentia.Result.TimeStart = (Get-Date).DateTime

    # Import default Configurations
    $valeWarningMessages.warn_import_configuration | Write-ValentiaVerboseDebug
    Import-ValentiaConfiguration

    # Import default Modules
    $valeWarningMessages.warn_import_modules | Write-ValentiaVerboseDebug
    Import-valentiaModules

    # Log Setting
    New-ValentiaLog

    # Set Task and push CurrentContext
    $task = Push-ValentiaCurrentContextToTask -ScriptBlock $ScriptBlock -TaskFileName $TaskFileName
  
    # Set Task as CurrentContext with task key
    $valentia.Result.ScriptTorun = $task.Action

    # Obtain DeployMember IP or Hosts for deploy
    try
    {
        "Get host addresses to connect." | Write-ValentiaVerboseDebug
        $valentia.Result.DeployMembers = Get-valentiaGroup -DeployFolder $DeployFolder -DeployGroup $DeployGroups
    }
    catch
    {
        $valentia.Result.SuccessStatus += $false
        $valentia.Result.ErrorMessageDetail += $_
        Write-Error $_
    }

    # Show Stopwatch for Begin section
    Write-Verbose ("{0}Duration Second for Begin Section: {1}" -f "`t`t", $Stopwatch.Elapsed.TotalSeconds)
}