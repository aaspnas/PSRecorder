function sysrec {
$a =  gwmi -class Win32_PerfFormattedData_PerfOS_System
gwmi -class Win32_PerfFormattedData_PerfOS_Memory
gwmi -class Win32_OperatingSystem
gwmi -class Win32_PerfFormattedData_Tcpip_NetworkInterface
}
