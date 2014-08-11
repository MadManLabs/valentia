#
# Module manifest for module 'valentia'
#
# Generated by: guitarrapc
#
# Generated on: 8/12/2014
#

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '0.4.5'

# ID used to uniquely identify this module
GUID = 'a85a5213-4610-4c52-9429-087dde841539'

# Author of this module
Author = 'guitarrapc'

# Company or vendor of this module
CompanyName = 'guitarrapc'

# Copyright statement for this module
Copyright = '(c) 2014 guitarrapc. All rights reserved.'

# Description of the functionality provided by this module
Description = 'PowerShell Remote deployment library for Windows Servers'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0.0.0'

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @('valentia.psm1')

# Functions to export from this module
FunctionsToExport = 'Invoke-Valentia', 'Invoke-ValentiaAsync', 'Invoke-ValentiaDownload', 
               'Ping-ValentiaGroupAsync', 'Watch-ValentiaPingAsyncReplyStatus', 
               'Invoke-ValentiaSync', 'Invoke-ValentiaUpload', 
               'Invoke-ValentiaUploadList', 'Convert-ValentiaDecryptPassword', 
               'Convert-ValentiaEncryptPassword', 'Export-ValentiaCertificate', 
               'Export-ValentiaCertificatePFX', 'Get-ValentiaCertificateFromCert', 
               'Import-ValentiaCertificate', 'Import-ValentiaCertificatePFX', 
               'Remove-ValentiaCertificate', 'Remove-ValentiaCertificatePFX', 
               'Show-ValentiaCertificate', 'Invoke-ValentiaClean', 
               'Get-ValentiaComputerName', 'Rename-ValentiaComputerName', 
               'Edit-ValentiaConfig', 'Show-ValentiaConfig', 
               'Get-ValentiaCredential', 'Set-ValentiaCredential', 
               'Get-ValentiaHostEntryAsync', 'New-ValentiaDynamicParamMulti', 
               'Get-ValentiaFileEncoding', 'New-ValentiaFolder', 'Get-ValentiaGroup', 
               'Invoke-ValentiaDeployGroupRemark', 
               'Invoke-ValentiaDeployGroupUnremark', 'New-ValentiaGroup', 
               'Show-ValentiaGroup', 'Initialize-ValentiaEnvironment', 
               'Set-ValentiaLocation', 'New-ValentiaLog', 
               'Show-ValentiaPromptForChoice', 'Set-ValentiaScheduledTask', 
               'Invoke-ValentiaSed', 'Get-ValentiaSymbolicLink', 
               'Remove-ValentiaSymbolicLink', 'Set-ValentiaSymbolicLink', 
               'ConvertTo-ValentiaTask', 'Get-ValentiaTask', 'New-ValentiaOSUser', 
               'Get-ValentiaRebootRequiredStatus', 
               'Set-ValetntiaWSManConfiguration'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = 'valentia'

# Aliases to export from this module
AliasesToExport = 'Task', 'Vale', 'Valea', 'Upload', 'UploadL', 'Sync', 'Download', 'Go', 'Clean', 
               'Reload', 'Target', 'PingAsync', 'Sed', 'ipremark', 'ipunremark', 'Cred', 
               'Rename', 'DynamicParameter', 'Initial'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess
# PrivateData = ''

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


