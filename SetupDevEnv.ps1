# Created by Aaron Jefferies

# Define installation path (optional)
$installPath = "$env:ProgramFiles"

# Install Chocolatey (Package Manager)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Update PATH for Chocolatey in current session
$env:Path += ";$($env:ChocolateyInstall)\bin"

# Function to install a Chocolatey package
function Install-ChocoPackage {
    param ([string]$package)
    try {
        Write-Host "Installing $package..."
        choco install $package -y
    } catch {
        Write-Host "Failed to install $package. Error: $_"
    }
}

# Function to verify the installation of a command
function Verify-Installation {
    param ([string]$command)
    if (Get-Command $command -ErrorAction SilentlyContinue) {
        Write-Host "$command is installed."
    } else {
        Write-Host "$command is not installed"
    }
}

# Install required packages synchronously
Install-ChocoPackage "vscode"; Verify-Installation "code"
Install-ChocoPackage "git"; Verify-Installation "git"
Install-ChocoPackage "gh"; Verify-Installation "gh"
Install-ChocoPackage "awscli"; Verify-Installation "aws"
Install-ChocoPackage "nodejs-lts"; Verify-Installation "node"; Verify-Installation "npm"
Install-ChocoPackage "docker-desktop"; Verify-Installation "docker"
Install-ChocoPackage "python"; Verify-Installation "pip"
Install-ChocoPackage "7zip"; Verify-Installation "7z"

# Refresh PATH so new commands are usable
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

# Install AWS CDK globally
npm install -g aws-cdk

# Configure GitHub CLI (interactive login)
gh auth login
