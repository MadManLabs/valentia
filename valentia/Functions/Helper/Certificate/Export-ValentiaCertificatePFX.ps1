﻿#Requires -Version 3.0

#-- Helper for certificate --#

function Export-ValentiaCertificatePFX
{
    [CmdletBinding()]
    param
    (
        [parameter(mandatory = $true, position  = 0, ValueFromPipeline = 1, ValueFromPipelineByPropertyName = 1)]
        [ValidateNotNullOrEmpty()]
        [System.Security.Cryptography.X509Certificates.X509Certificate2]$pfx,

        [parameter(mandatory = $false, position  = 1)]
        [ValidateNotNullOrEmpty()]
        [string]$CN = $valentia.certificate.CN,

        [parameter(mandatory = $false, position  = 2)]
        [ValidateNotNullOrEmpty()]
        [string]$exportFilePath = $valentia.certificate.FilePath.PFX,
        
        [parameter(mandatory = $false, position  = 3)]
        [ValidateNotNullOrEmpty()]
        [System.Security.Cryptography.X509Certificates.X509ContentType]$PFXType = $valentia.certificate.export.PFXType,

        [parameter(mandatory = $false, position  = 4)]
        [ValidateNotNullOrEmpty()]
        [PSCredential]$Credential = $null
    )
    
    process
    {
        "Export pfx '{0}' as object." -f $cert.ThumbPrint | Write-ValentiaVerboseDebug
        $pfxToExportInBytes = $pfx.Export($PFXType, $credential.GetNetworkCredential().Password)
        [System.IO.File]::WriteAllBytes($FilePath, $pfxToExportInBytes)
    }

    begin
    {
        "Export Path setup." | Write-ValentiaVerboseDebug
        $FilePath = $exportFilePath -f $CN
        $dir      = Split-Path $FilePath -Parent
        if (-not (Test-Path $dir))
        {
            New-Item -Path $dir -ItemType Directory -Force 
        }
        elseif (Test-Path $FilePath)
        {
            Remove-Item -Path $FilePath -Confirm -Force
        }

        "Get pfx password to export." | Write-ValentiaVerboseDebug
        if ($null -eq $Credential)
        {
            $credential = Get-Credential -Credential "INPUT Password FOR PFX export."
        }

        if (Test-Path $FilePath)
        {
            throw "Certificate already exist in '{0}'. Make sure you have delete exist cert before export." -f $FilePath
        }
    }
}