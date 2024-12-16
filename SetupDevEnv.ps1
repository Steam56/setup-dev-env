# Define installation paths (optional)
$installPath = "$env:ProgramFiles"

# Install Chocolatey (Package Manager)
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Update PATH
$env:Path += ";$($env:ChocolateyInstall)\bin"

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
Verify-Installation -command "awscliv"
# Install Node.js
Install-ChocoPackage -package "nodejs-lts"
Verify-Installation -command "nodejs-lts"
# Install Docker
Install-ChocoPackage -package "docker-desktop"
Verify-Installation -command "docker"
Start-Service -Name "com.docker.service"
# Install AWS CDK
npm install -g aws-cdk

# Configure GitHub CLI (interactive login)
gh auth login
