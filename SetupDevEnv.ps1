# Define installation paths (optional)
$installPath = "$env:ProgramFiles"

# Install Chocolatey (Package Manager)
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Update PATH
$env:Path += ";$($env:ChocolateyInstall)\bin"

# Install Visual Studio Code
choco install vscode -y

# Install Git
choco install git -y

# Install GitHub CLI
choco install gh -y

# Install AWS CLI
choco install awscli -y

# Install Node.js
choco install nodejs-lts -y

# Install AWS CDK
npm install -g aws-cdk

# Configure GitHub CLI (interactive login)
gh auth login
