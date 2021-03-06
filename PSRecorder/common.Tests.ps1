﻿$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
$logdir = "C:\kronometrix"

Describe "common" {
    It "checks that logdir exists" {
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
        $us.Length -ge 15 | Should Be $true
        $us -match '^\d+\.\d+$' | Should Be $true
    }
}


Describe "can obtain gwmi data" {
    It "can get win32_bios" {
        $wmidata = gwmi -Class Win32_Bios
        $wmidata.SerialNumber.Length -ge 20 | Should Be $true
    }

}
