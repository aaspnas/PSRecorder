$td = Split-Path -Parent $MyInvocation.MyCommand.Path
. $td\common.ps1



function sysrec {

    Param(
    [switch]$h,
    [switch]$v,
    [int]$delay = 60,
    [int]$maxiteration = 0
    )

    $iteration = 0
    $continue = $true
    if ($h) {return display-helptxt}
    if ($v) {return display-versiontxt}

    $stat = create-logdir
    $logfile = "$logdir\sysrec.raw"
    while ($continue) {
        if ($maxiteration) {
            $iteration++
            if ($iteration -ge $maxiteration) {
                $continue = $false
            }
        }

        $starttime = get-timestamp
        $proc = gwmi -class Win32_PerfFormattedData_PerfOS_Processor
        $osp =  gwmi -class Win32_PerfFormattedData_PerfOS_System
        $mem = gwmi -class Win32_PerfFormattedData_PerfOS_Memory
        $conf = gwmi -class Win32_OperatingSystem
        $net = gwmi -class Win32_PerfFormattedData_Tcpip_NetworkInterface

        $line = ""
        $line += $stattime

        $line >> $logfile
        $endtime = get-timestamp
        $sleeptime = $delay - ($endtime - $starttime)
        if ($sleeptime -gt 0) {
            Start-Sleep -Seconds $sleeptime
        }

    }
}

function display-helptxt {}
function display-versiontxt {}

