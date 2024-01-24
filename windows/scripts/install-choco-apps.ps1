# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install -y --package-parameters=/SSHServerFeature openssh
choco install -y 7zip
choco install -y autoruns
choco install -y BGInfo
choco install -y git
choco install -y logexpert
choco install -y wintail
choco install -y notepad2
