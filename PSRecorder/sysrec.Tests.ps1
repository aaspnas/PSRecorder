$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

$logdir = "C:\kronometrix"

Describe "sysrec" {
    It "logdir exists" {
        test-path "$logdir" | Should Be $true
    }
    It "can write files to logdir" {
        "test" > "$logdir\testfile.log"
        test-path "$logdir\testfile.log" | Should Be $true
        del "$logdir\testfile.log" -Force
    }
}
Describe "get-timestamp" {
    $ts = get-timestamp -s
    $us = get-timestamp 
    It "can obtain EPOC" {
        $ts.Length -ge 10 | Should Be $true
        $ts -match '^\d+$' | Should Be $true
        $us.Length -ge 16 | Should Be $true
        $us -match '^\d+\.\d+$' | Should Be $true

    }
}


Describe "get-epoc" {

}
