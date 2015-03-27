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
