$td = Split-Path -Parent $MyInvocation.MyCommand.Path
. $td\common.ps1


function sysrec {
    $stat = create-logdir
    $logfile = "$logdir\sysrec.raw"
    $time = get-timestamp
    $proc = gwmi -class Win32_PerfFormattedData_PerfOS_Processor
    $osp =  gwmi -class Win32_PerfFormattedData_PerfOS_System
    $mem = gwmi -class Win32_PerfFormattedData_PerfOS_Memory
    $conf = gwmi -class Win32_OperatingSystem
    $net = gwmi -class Win32_PerfFormattedData_Tcpip_NetworkInterface

    $line = ""
    $line += $time

    $line >> $logfile
}
