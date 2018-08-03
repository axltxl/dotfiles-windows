#Requires -Version 5.0
#Requires -RunAsAdministrator

# Stop this script at the very first sign of error
# Source: https://stackoverflow.com/questions/9948517/how-to-stop-a-powershell-script-on-the-first-error
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

# Absolute path to this script
$dotfiles_dir=$PSScriptRoot

# FIXME
$DOT_HOME="$HOME\.dotfiles"

# Load Dot module
Import-Module -Force $dotfiles_dir\dot\lib\Dot.psm1

############################
# It is essential to warn the user about the consequences
# of running the installation script, since it really alters
# things inside the home directory
############################
dot_splash
dot_printf "This is really going to assf*ck your home directory ..."
$answer = $null
While (!($answer -eq "y" ) -And !($answer -eq "n")) {
    $answer = Read-Host "Are you sure about this? (y/n)> "
}
If ($answer -eq "n") {
    Exit 0
}

# Set up formal $DOT_HOME to be used
# by scripts
dot_printf "Set up dotfiles root directory at $DOT_HOME"
New-Item -ItemType SymbolicLink -Path $DOT_HOME -Target $dotfiles_dir -Force

# Set up powershell
# dot_printf "Setting up Powershell environment ..."
# TODO: this is your next task
# https://technet.microsoft.com/en-us/library/bb613488(v=vs.85).aspx

# Install-Chocolatey
dot_install_choco

# Finished
dot_printf "---------------------------------------------------"
dot_printf "Your dotfiles environment has been properly set up."
dot_printf "You will need to re-login for the changes to be applied."
dot_printf "Once done, you can proceed to change your environment using"
dot_printf "the *dot* command, execute dot without arguments for details."
