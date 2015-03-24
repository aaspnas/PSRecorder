function sysrec {
$osp =  gwmi -class Win32_PerfFormattedData_PerfOS_System
$mem = gwmi -class Win32_PerfFormattedData_PerfOS_Memory
$conf = gwmi -class Win32_OperatingSystem
$net = gwmi -class Win32_PerfFormattedData_Tcpip_NetworkInterface


}
