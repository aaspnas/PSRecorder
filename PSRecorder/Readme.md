#Recorders for Kronometrix written in PowerShell

These recorders are all basically self sufficient, in the sense that the only environment they 
need is a Windows server with Powershell version 3 installed. There is no installation required, 
no additional programming language environment needed or any special access. Only ensure that the 
execution policy is set to allow script execution.

The recorders are designed to be as close in behavior to the official perl versions as possible, but 
there exist some minor differencies:

* Command has a .ps1 extenion as custom in PowerShell
* ...

hwrec.ps1 contains the recording unit for hwrec
sysrec.ps1 contains the sysrec recording unit
common.ps1 contain common functionality used by all recorders


The repository also contains Pester test scripts for all functionality, that can be ignored. If you 
would like to execute the tests you will however need to install the Pester module.
