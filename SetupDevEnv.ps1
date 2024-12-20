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

# Install Visual Studio Code
Install-ChocoPackage -package "vscode"
Verify-Installation -command "vscode"

# Install Git
Install-ChocoPackage -package "git"
Verify-Installation -command "git"

# Install GitHub CLI
Install-ChocoPackage -package "gh"
Verify-Installation -command "gh"

# Install AWS CLI
Install-ChocoPackage -package "awscli"
Verify-Installation -command "aws"

# Install Node.js and verify Node.js and npm
Install-ChocoPackage -package "nodejs-lts"
Verify-Installation -command "node"
Verify-Installation -command "npm"

# Install Docker and start Docker service
Install-ChocoPackage -package "docker-desktop"
Verify-Installation -command "docker"
Start-Service -Name "com.docker.service"

# Verify Docker service is running
if ((Get-Service -Name "com.docker.service").Status -eq 'Running') {
    Write-Host "Docker service is running."
} else {
    Write-Host "Docker service is not running."
}

# Install Python
Install-ChocoPackage -package "python"
Verify-Installation -command "pip"

# Install 7zip
Install-ChocoPackage -package "7zip"
Verify-Installation -command "7zip"

# Install AWS CDK globally
npm install -g aws-cdk

# Configure GitHub CLI (interactive login)
gh auth login