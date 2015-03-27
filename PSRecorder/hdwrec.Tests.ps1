$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "hdwrec" {
    It "Displays help" {
        (hdwrec -h)  | Should Be $true
    }
}
