# If running from shell you will need to set the exe privileges:
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass


# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install packages from a text file
#Get-Content packages.txt | ForEach-Object { choco install $_ -y }
Get-Content packages.txt | Where-Object { $_ -notmatch '^\s*#' } | ForEach-Object { choco install $_ -y }

