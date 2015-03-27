$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"


Describe "sysrec" {
    It "can create log with measurement line" {
        $foo = sysrec
        test-path "$logdir\sysrec.raw" | Should Be $true
        $cont = gc "$logdir\sysrec.raw"
        $cont.count -ge 1 | Should Be $true

    }
    It "displays usage" {
        $foo = sysrec -h
                "$foo".Contains('Usage') | Should be $true        
                "$foo".Contains('sysrec') | Should be $true
    }
    It "displays version" {
        $foo = sysrec -h
        "$foo".Contains('Version') | Should be $true
    }

}


