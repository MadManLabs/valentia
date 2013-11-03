#
# モジュール 'valentia' のモジュール マニフェスト
#
# 生成者: guitarrapc
#
# 生成日: 2013/11/03
#

@{

# このマニフェストに関連付けられているスクリプト モジュール ファイルまたはバイナリ モジュール ファイル。
RootModule = 'valentia.psm1'

# このモジュールのバージョン番号です。
ModuleVersion = '0.3.2'

# このモジュールを一意に識別するために使用される ID
GUID = '6d955c46-1afe-42d3-834a-12ca1c03eefb'

# このモジュールの作成者
Author = 'guitarrapc'

# このモジュールの会社またはベンダー
CompanyName = 'guitarrapc'

# このモジュールの著作権情報
Copyright = '(c) 2013 guitarrapc. All rights reserved.'

# このモジュールの機能の説明
Description = 'PowerShell Remote deployment library for Windows Servers'

# このモジュールに必要な Windows PowerShell エンジンの最小バージョン
PowerShellVersion = '3.0'

# このモジュールに必要な Windows PowerShell ホストの名前
# PowerShellHostName = ''

# このモジュールに必要な Windows PowerShell ホストの最小バージョン
# PowerShellHostVersion = ''

# このモジュールに必要な Microsoft .NET Framework の最小バージョン
DotNetFrameworkVersion = '4.0'

# このモジュールに必要な共通言語ランタイム (CLR) の最小バージョン
CLRVersion = '4.0.30319.17929'

# このモジュールに必要なプロセッサ アーキテクチャ (なし、X86、Amd64)
# ProcessorArchitecture = ''

# このモジュールをインポートする前にグローバル環境にインポートされている必要があるモジュール
# RequiredModules = @()

# このモジュールをインポートする前に読み込まれている必要があるアセンブリ
# RequiredAssemblies = @()

# このモジュールをインポートする前に呼び出し元の環境で実行されるスクリプト ファイル (.ps1)。
# ScriptsToProcess = @()

# このモジュールをインポートするときに読み込まれる型ファイル (.ps1xml)
# TypesToProcess = @()

# このモジュールをインポートするときに読み込まれる書式ファイル (.ps1xml)
# FormatsToProcess = @()

# RootModule/ModuleToProcess に指定されているモジュールの入れ子になったモジュールとしてインポートするモジュール
# NestedModules = @()

# このモジュールからエクスポートする関数
FunctionsToExport = 'Get-ValentiaTask', 'Invoke-ValentiaParallel', 
               'Invoke-ValentiaCommandParallel', 'Invoke-Valentia', 
               'Invoke-ValentiaCommand', 'Invoke-ValentiaAsync', 
               'Invoke-ValentiaUpload', 'Invoke-ValentiaUploadList', 
               'Invoke-ValentiaSync', 'Invoke-ValentiaDownload', 'New-ValentiaGroup', 
               'Get-ValentiaGroup', 'Show-ValentiaGroup', 
               'Invoke-valentiaDeployGroupRemark', 
               'Invoke-valentiaDeployGroupUnremark', 'New-ValentiaCredential', 
               'Get-ValentiaCredential', 'Set-ValentiaLocation', 
               'Invoke-ValentiaClean', 'New-ValentiaFolder', 
               'Initialize-valentiaEnvironment', 'Get-ValentiaModuleReload', 
               'Set-ValentiaHostName', 'Get-ValentiaRebootRequiredStatus'

# このモジュールからエクスポートするコマンドレット
CmdletsToExport = '*'

# このモジュールからエクスポートする変数
VariablesToExport = 'valentia'

# このモジュールからエクスポートするエイリアス
AliasesToExport = 'Task', 'Valep', 'CommandP', 'Vale', 'Command', 'Valea', 'Upload', 'UploadL', 
               'Sync', 'Download', 'Go', 'Clean', 'Reload', 'Target', 'ipremark', 'ipunremark', 
               'Cred', 'Rename', 'Initial'

# このモジュールに同梱されているすべてのモジュールのリスト
# ModuleList = @()

# このモジュールに同梱されているすべてのファイルのリスト
# FileList = @()

# RootModule/ModuleToProcess に指定されているモジュールに渡すプライベート データ
# PrivateData = ''

# このモジュールの HelpInfo URI
# HelpInfoURI = ''

# このモジュールからエクスポートされたコマンドの既定のプレフィックス。既定のプレフィックスをオーバーライドする場合は、Import-Module -Prefix を使用します。
# DefaultCommandPrefix = ''

}

