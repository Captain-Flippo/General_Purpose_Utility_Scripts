#!/usr/bin/env pwsh
# This script will swap between two sets of git credentials

# Define the two sets of credentials
$credentials1 = @{
    Username = "1st Username"
    Email = "1st_email"
}

$credentials2 = @{
    Username = "2nd Username"
    Email = "2nd_email"
}

# Check the current username and email configurations
$currentUsername = git config --global user.name
$currentEmail = git config --global user.email

# Swap out the username and email configurations
if ($currentUsername -eq $credentials1.Username -and $currentEmail -eq $credentials1.Email) {
    git config --global user.name $credentials2.Username
    git config --global user.email $credentials2.Email
    $newCredentials = $credentials2
} else {
    git config --global user.name $credentials1.Username
    git config --global user.email $credentials1.Email
    $newCredentials = $credentials1
}

# Display the current set username and email configurations
Write-Host "Current git credentials:"
Write-Host "Username: $($newCredentials.Username)"
Write-Host "Email: $($newCredentials.Email)"