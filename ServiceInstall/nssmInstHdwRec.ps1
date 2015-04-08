$cmdline = "-ExecutionPolicy remotesigned -File hdwrec.ps1"
$appPS = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$AppStderr = "C:\kronometrix\stderr.log"
$AppStdout = "C:\kronometrix\stdout.log"
$AppDirectory = "C:\Users\aaspnas\scripts\PSRecorder"

nssm install hdwrec $appPS $cmdline
nssm set hdwrec AppDirectory $AppDirectory 
nssm set hdwrec Application $appPS
nssm set hdwrec AppParameters $cmdline
nssm set hdwrec AppStdout $AppStdout
nssm set hdwrec AppStderr $AppStderr