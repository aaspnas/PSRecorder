$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "hdwrec" {
    It "Displays help" {
        (hdwrec -h)  | Should Be $true
    }
    It "Displays version" {
        (hdwrec -h)  | Should Be $true
    }
    It "Displays data" {
        (hdwrec 1 1).Split(';').Count -gt 9  | Should Be $true
    }
    It "iterates ten times" {
        (hdwrec 0 10).Split(';').Count -gt 9  | Should Be $true
    }    

}
