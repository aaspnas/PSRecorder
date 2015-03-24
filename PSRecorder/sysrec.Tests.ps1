$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

$logdir = "C:\kronometrix"

Describe "sysrec" {
    It "can write files" {
        test-path "$logdir\sysrec" | Should Be $true
    }
}

Describe "get-epoc" {

}
