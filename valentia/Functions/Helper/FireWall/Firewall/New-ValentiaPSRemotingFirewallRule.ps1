﻿#Requires -Version 3.0

#-- Prerequisite OS Setting Module Functions --#

<#
.SYNOPSIS 
Create New Firewall Rule for PowerShell Remoting

.DESCRIPTION
Will allow PowerShell Remoting port for firewall

.NOTES
Author: guitarrapc
Created: 18/Jul/2013

.EXAMPLE
Enable-PSRemotingFirewallRule
--------------------------------------------
Add PowerShellRemoting-In accessible rule to Firewall.
#>
function New-ValentiaPSRemotingFirewallRule
{
    [CmdletBinding()]
    param
    (
        [Parameter(Position = 0, mandatory = $false, HelpMessage = "Input PowerShellRemoting-In port. default is 5985")]
        [int]$PSRemotePort = 5985,

        [Parameter(Position = 1, mandatory = $false, HelpMessage = "Input Name of Firewall rule for PowerShellRemoting-In.")]
        [string]$Name = "Windows Remote Management (HTTP-In)",

        [Parameter(Position = 2, mandatory = $false, HelpMessage = "Input Decription of Firewall rule for PowerShellRemoting-In.")]
        [string]$Description = "Windows PowerShell Remoting required to open for public connection. not for private network.",

        [Parameter(Position = 2, mandatory = $false, HelpMessage = "Input Group of Firewall rule for PowerShellRemoting-In.")]
        [string]$Group = "Windows Remote Management"
    )

    $ErrorActionPreference = $valentia.preference.ErrorActionPreference.custom
    Set-StrictMode -Version latest

    if (-not((Get-NetFirewallRule | where Name -eq $Name) -and (Get-NetFirewallPortFilter -Protocol TCP | where Localport -eq $PSRemotePort)))
    {
        Write-Verbose ("Windows PowerShell Remoting port TCP $PSRemotePort was not opend. Set new rule '{1}'" -f $PSRemotePort, $Name)
        New-NetFirewallRule `
            -Name $Name `
            -DisplayName $Name `
            -Description $Description `
            -Group $Group `
            -Enabled True `
            -Profile Any `
            -Direction Inbound `
            -Action Allow `
            -EdgeTraversalPolicy Block `
            -LooseSourceMapping $False `
            -LocalOnlyMapping $False `
            -OverrideBlockRules $False `
            -Program Any `
            -LocalAddress Any `
            -RemoteAddress Any `
            -Protocol TCP `
            -LocalPort $PSRemotePort `
            -RemotePort Any `
            -LocalUser Any `
            -RemoteUser Any 
    }
    else
    {
        "Windows PowerShell Remoting port TCP 5985 was alredy opened. Get Firewall Rule." | Write-ValentiaVerboseDebug
        Get-NetFirewallPortFilter -Protocol TCP | where Localport -eq 5985
    }

    if ((Get-WinSystemLocale).Name -eq "ja-JP")
    {
        $japanesePSRemoteingEnableRule = "Windows リモート管理 (HTTP 受信)"
        if (-not((Get-NetFirewallRule | where DisplayName -eq $japanesePSRemoteingEnableRule | where Profile -eq "Any") -and (Get-NetFirewallPortFilter -Protocol TCP | where Localport -eq $PSRemotePort)))
        {
            ("日本語OSと検知しました。'{0}' という名称で TCP '{1}' をファイアウォールに許可します。" -f $japanesePSRemoteingEnableRule, 5985) | Write-ValentiaVerboseDebug
            New-NetFirewallRule `
                -Name $japanesePSRemoteingEnableRule `
                -DisplayName $japanesePSRemoteingEnableRule `
                -Description $Description `
                -Group $Group `
                -Enabled True `
                -Profile Any `
                -Direction Inbound `
                -Action Allow `
                -EdgeTraversalPolicy Block `
                -LooseSourceMapping $False `
                -LocalOnlyMapping $False `
                -OverrideBlockRules $False `
                -Program Any `
                -LocalAddress Any `
                -RemoteAddress Any `
                -Protocol TCP `
                -LocalPort $PSRemotePort `
                -RemotePort Any `
                -LocalUser Any `
                -RemoteUser Any 
        }
    }
}
