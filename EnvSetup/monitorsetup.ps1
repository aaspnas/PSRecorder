## Target to have this PowerShell version 2 compatible

## create dir
$rootdir = [string]$env:HOME + "\scripts"
if ( Test-Path -Path $rootdir ) { 
    cd $rootdir
} else {
    mkdir $rootdir
    cd $rootdir
}
## copy scripts from github

## Create service
## Test and verification functions