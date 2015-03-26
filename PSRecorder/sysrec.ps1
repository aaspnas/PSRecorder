$logdir = "C:\kronometrix"

function get-timestamp ([switch]$s = $false) {
    if ($s) {
        return (Get-Date -UFormat "%s").Split('.')[0]
    } else {
        return (Get-Date -UFormat "%s")  
    }

}

function create-logdir () {
    if (Test-Path $logdir) {
        return 2
    } else {
        $d = mkdir -Path $logdir
        return 3
    }
}



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
