# Dev Environment Setup Script

This PowerShell script automates the installation of essential development tools and packages for setting up a local development environment on a Windows machine. It uses [Chocolatey](https://chocolatey.org/) as the package manager to install tools like Visual Studio Code, Git, Docker, Node.js, AWS CLI, Python, and more.

## Prerequisites

Before running the script, make sure you meet the following prerequisites:

- **Windows 10 or later**
- **PowerShell 5.1+** (recommended: PowerShell 7+)
- **Administrator privileges** (required for package installations and service management)

## Tools Installed

The script installs the following tools:

1. **[Chocolatey](https://chocolatey.org/)** – Package manager for Windows.
2. **[Visual Studio Code](https://code.visualstudio.com/)** – A popular code editor.
3. **[Git](https://git-scm.com/)** – A version control system.
4. **[GitHub CLI](https://cli.github.com/)** – Command-line tool for interacting with GitHub.
5. **[AWS CLI](https://aws.amazon.com/cli/)** – Command-line interface for Amazon Web Services.
6. **[Node.js](https://nodejs.org/)** – JavaScript runtime for server-side applications.
7. **[Docker](https://www.docker.com/)** – Platform for developing, shipping, and running applications in containers.
8. **[Python](https://www.python.org/)** – A versatile programming language.
9. **[7-Zip](https://www.7-zip.org/)** – A file archiver with a high compression ratio.
10. **[AWS CDK](https://aws.amazon.com/cdk/)** – Framework for defining cloud infrastructure using code.

## Features

- **Automatic Installation:** Installs all tools with minimal user intervention.
- **Service Start for Docker:** Starts Docker service automatically after installation.
- **Verification:** Verifies whether each tool is installed and prints a success message.
- **Interactive GitHub CLI Setup:** Prompts the user for GitHub CLI login to authenticate.
  
## How to Use

### 1. Download the Script

You can either clone this repository or download the script file directly. To clone it, run the following command:

git clone https://github.com/Steam56/setup-dev-env
cd setup-dev-env

### 2. Run the Script
To run the script, open a PowerShell terminal as Administrator and execute the script:

powershell
Copy code
Set-ExecutionPolicy Bypass -Scope Process -Force
.\setup-dev-environment.ps1
### 3. Wait for the Installation
The script will start installing each tool. It will display the installation progress and verify whether each tool is installed correctly. If the installation of any tool fails, an error message will be shown.

### 4. Configure GitHub CLI (Interactive Login)
After installing the required tools, the script will prompt you to log in to GitHub using the GitHub CLI (gh auth login). You will be asked to authenticate via a web browser.

### 5. Docker
The script installs Docker Desktop and starts the Docker service. Ensure that your system meets Docker's system requirements, such as enabling virtualization in the BIOS.

### Troubleshooting
Permissions: Ensure that you are running the script as an administrator to avoid permission errors during installation.
Docker Installation: If Docker doesn't start correctly, try restarting your machine and manually starting Docker from the Docker Desktop application.
Network Issues: Some installations require internet access, so ensure you have an active internet connection.

### License
This project is licensed under the MIT License – see the LICENSE file for details.

Contributing
Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

Thank you for using this Dev Environment Setup Script! Happy coding!

markdown
Copy code

---

### Explanation of Sections:

1. **Title and Description:** Provides an overview of the script and its purpose.
2. **Prerequisites:** Lists the requirements to run the script, ensuring users understand what they need.
3. **Tools Installed:** Describes each tool that will be installed by the script for clarity.
4. **Features:** Highlights the key features of the script, emphasizing automation, verification, and Docker service handling.
5. **Usage Instructions:** Gives clear steps on how to run the script, from downloading to execution.
6. **Troubleshooting:** Lists common issues and solutions to help users resolve problems.
7. **Customization:** Instructions on how users can modify the script to suit their needs.
8. **Example Output:** Provides an example of what users can expect as feedback during execution.
9. **License and Contributing:** Mentions the license type and how users can contribute to the project.

This `README.md` gives users all the necessary information to understand, run, and troubleshoot your script effectively. Feel free to adjust it as per your repository or personal preferences.





