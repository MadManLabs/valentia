#Requires -Version 3.0

param
(
    [parameter(mandatory)]
    [string[]]
    $taskFile = $null
)

# Import-Module PSAWSModule
# Import-Module valentia

# Confirm
$deploygroup = Show-ValentiaPromptForChoice -questions (Show-ValentiaGroup).Name -title ("'{0}' �� ���s����O���[�v��I�����Ă��������B"�@-f $taskFile) -message "�A���t�@�x�b�g����Ώۂ�I�����ĂˁI"

# Free input
if ($deploygroup -eq "InputAny.ps1")
{
    [string[]]$deploygroup = (Read-Host "�f�v���C�O���[�v�Ώۂ�IP��z�X�g������͂��Ă��������B(,��؂�ŕ������͉\)") -split ","
}

# Run
Write-Host '���s���܂�' -ForegroundColor Cyan

foreach ($task in $taskFile)
{
    valea $deploygroup .\$task -quiet
}