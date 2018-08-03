#Require -Version 5.0

# Stop this script at the very first sign of error
# Source: https://stackoverflow.com/questions/9948517/how-to-stop-a-powershell-script-on-the-first-error
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

# Print a generic message
Function Show-Message {
    Param ([string] $message)
    Write-Host "* $message"
}

# Print a nice splash
Function Show-Splash {
    Write-Host "***************************************************"
    Write-Host "  _________     _______________________            ";
    Write-Host "  ______  /_______  /___  __/__(_)__  /____________";
    Write-Host "  _  __  /_  __ \  __/_  /_ __  /__  /_  _ \_  ___/";
    Write-Host "  / /_/ / / /_/ / /_ _  __/ _  / _  / /  __/(__  ) ";
    Write-Host "  \__,_/  \____/\__/ /_/    /_/  /_/  \___//____/  ";
    Write-Host "              (Windoze Edition)                    ";
    Write-Host "***************************************************"
}

Function Install-PowershellEnv {

}

# Install chocolate
Function Install-Chocolatey {
    If (Get-Command "choco.exe" -ErrorAction SilentlyContinue) {
        Show-Message "Chocolatey already present in this system. Skipping installation ..."
        Return
    }

    # Install Chocolatey
    # (As specified in https://chocolatey.org/install)
    Show-Message "Installing Chocolatey (this might take a while) ..."
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Create aliases for each function in this module
New-Alias dot_printf        Show-Message
New-Alias dot_splash        Show-Splash
New-Alias dot_install_choco Install-Chocolatey
