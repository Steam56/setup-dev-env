# Created by Aaron Jefferies

# Define installation paths (optional)
$installPath = "$env:ProgramFiles"

# Install Chocolatey (Package Manager)
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Update PATH
$env:Path += ";$($env:ChocolateyInstall)\bin"

# Function to install a Chocolatey package
function Install-ChocoPackage {
    param (
        [string]$package
    )
    try {
        Write-Host "Installing $package..."
        choco install $package -y
    } catch {
        Write-Host "Failed to install $package. Error: $_"
    } 
}

# Function to verify the installation of a command
function Verify-Installation {
    param (
        [string]$command
    )
    if (Get-Command $command -ErrorAction SilentlyContinue) {
        Write-Host "$command is installed."
    } else {
        Write-Host "$command is not installed"
    }
}

# Store functions in a script block
$initScript = {
    function Install-ChocoPackage {
        param (
            [string]$package
        )
        try {
            Write-Host "Installing $package..."
            choco install $package -y
        } catch {
            Write-Host "Failed to install $package. Error: $_"
        } 
    }

    function Verify-Installation {
        param (
            [string]$command
        )
        if (Get-Command $command -ErrorAction SilentlyContinue) {
            Write-Host "$command is installed."
        } else {
            Write-Host "$command is not installed"
        }
    }
}

# Start jobs with initialization script
$vscode = Start-Job -ScriptBlock { Install-ChocoPackage -package "vscode"; Verify-Installation -command "vscode" } -InitializationScript $initScript
$git = Start-Job -ScriptBlock { Install-ChocoPackage -package "git"; Verify-Installation -command "git" } -InitializationScript $initScript
$GitHub = Start-Job -ScriptBlock { Install-ChocoPackage -package "gh"; Verify-Installation -command "gh" } -InitializationScript $initScript
$aws = Start-Job -ScriptBlock { Install-ChocoPackage -package "awscli"; Verify-Installation -command "aws" } -InitializationScript $initScript
$node = Start-Job -ScriptBlock { Install-ChocoPackage -package "nodejs-lts"; Verify-Installation -command "node"; Verify-Installation -command "npm" } -InitializationScript $initScript
$docker = Start-Job -ScriptBlock { Install-ChocoPackage -package "docker-desktop"  -installArgs '"ADD_WCOW_FEATURES=1"'; Verify-Installation -command "docker"; Start-Service -Name "com.docker.service" } -InitializationScript $initScript
$python = Start-Job -ScriptBlock { Install-ChocoPackage -package "python"; Verify-Installation -command "pip" } -InitializationScript $initScript
$zip = Start-Job -ScriptBlock { Install-ChocoPackage -package "7zip"; Verify-Installation -command "7zip" } -InitializationScript $initScript

# Wait for jobs to complete
Wait-Job -Job $vscode, $git, $GitHub, $aws, $node, $docker, $python, $zip

# Install AWS CDK globally
npm install -g aws-cdk

# Configure GitHub CLI (interactive login)
gh auth login
