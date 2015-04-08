$td = Split-Path -Parent $MyInvocation.MyCommand.Path
. $td\common.ps1

function hdwrec {

    Param(
    [switch]$h,
    [switch]$v,
    [int]$interval = 60,
    [int]$count = 0
    )

    $iteration = 0
    $continue = $true
    if ($h) {return display-helptxt}
    if ($v) {return display-versiontxt}


    while ($continue) {
        if ($count) {
            $iteration++
            if ($iteration -ge $count) {
                $continue = $false
            }
        }

        $starttime = get-timestamp
        $wos = gwmi -class Win32_OperatingSystem
        $wcs = gwmi -class Win32_ComputerSystem
        $wproc = gwmi -class Win32_Processor
        $hdw = $wproc.AddressWidth
        ($maj, $min, $build) = $wos.Version.Split('.')
        $relos = $maj + '.' + $min  # Note: [environment]::OSVersion is deprecated
        $kernel = $build
        $pcpu = $wcs.NumberOfProcessors
        $vcpu = $wcs.NumberOfLogicalProcessors
        $memtotal = $wos.TotalVisibleMemorySize
        $swaptotal = $wos.SizeStoredInPagingFiles
        $freemem = $wos.FreePhysicalMemory

#   $cult = New-Object System.Globalization.CultureInfo("en-US")
#        $line = [string]::Format("{0:N0};{1};", 1, "foo");
#        $line = ""

        $line = [string]"" + $starttime 
        $line += ";" + (hostname) + ';' + $hdw
        $line += ";" + $relos + ';' + $kernel
        $line += ";" + $pcpu + ';' + $vcpu
        $line += ";" + $memtotal + ';' + $swaptotal + ';' + $freemem
        $line # >> $logfile
        $endtime = get-timestamp
        $sleeptime = $interval - ($endtime - $starttime)
        if (($sleeptime -gt 0) -and ($continue)) {
            Start-Sleep -Seconds $sleeptime
        }

    }

}

function display-helptxt {"Not implemented"}
function display-versiontxt {"1.0"}


$stat = create-logdir
$logfile = "$logdir\hdwrec.raw"
hdwrec 60 0 | Out-File -Encoding ascii -Append $logfile
