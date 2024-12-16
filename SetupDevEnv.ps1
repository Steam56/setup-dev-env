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



# Install Visual Studio Code
Install-ChocoPackage -package "vscode"

# Install Git
Install-ChocoPackage -package "git"

# Install GitHub CLI
Install-ChocoPackage -package "gh"

# Install AWS CLI
Install-ChocoPackage -package "awscli"

# Install Node.js
Install-ChocoPackage -package "nodejs-lts"

# Install AWS CDK
npm install -g aws-cdk

# Configure GitHub CLI (interactive login)
gh auth login
