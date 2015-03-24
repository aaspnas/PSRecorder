## Setting up dev env on server
## Enable Powershell 

Set-ExecutionPolicy Unrestricted -Force

## First get a package manager: Choclatey, see https://github.com/chocolatey/chocolatey/wiki/Installation

(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')))>$null 2>&1

## Set up git & pester

choco install git
choco install poshgit
choco install git-credential-winstore
choco install pester

[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files (x86)\Git\bin" , [System.EnvironmentVariableTarget]::Machine )

C:\ProgramData\chocolatey\lib\git-credential-winstore.1.2.0.0\lib\net40-Client\git-credential-winstore.exe -I "C:\Program Files (x86)\Git\bin\git.exe"


 . ($PROFILE).Replace('ISE','')

## shell need to be restared here... After git is working we create top level dir

$rootdir = [string]$env:HOME + "\scripts"
if ( Test-Path -Path $rootdir ) { 
    cd $rootdir
} else {
    mkdir $rootdir
    cd $rootdir
}

## Set up git
if (! (Test-Path -Path ".\.git\" )) {  
    git init
    git config --add user.name "Anders Aspnas"
    git config --add user.email "aaspnas@gmail.com"
    git config --global push.default matching
    git remote add origin https://github.com/aaspnas/PSRecorder.git
    git pull origin master
}

# Set up pester and app unless we got it from git remote

Import-Module Pester

$module = "PSRecorder"
$app = "sysrec"

if (!( Test-Path -Path ".\$module\$app*" )) { 

    new-fixture -path $module -name $app
}

## Open module in ISE
    ise ".\$module\$app.ps1"
    ise ".\$module\$app.Tests.ps1"

