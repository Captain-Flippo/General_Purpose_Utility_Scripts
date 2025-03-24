#!/bin/bash

# This script will install all the extensions listed in the arrays below.

main_extensions=(
    "mhutchie.git-graph" # Git graph
    "github.copilot" # GitHub copilot
    "github.copilot-chat" # GitHub copilot chat
    "ms-azuretools.vscode-docker" # Docker
    "ms-vscode-remote.remote-containers" # dev container support
    "ms-vscode-remote.remote-ssh" # SSH support
)

python_extensions=(
    "ms-python.python" # Main python extension
    "ms-python.isort" # Sort imports for python
    "ms-python.black-formatter" # Black formatter for python
    "ms-toolsai.jupyter" # Jupyter notebook support
)

sql_extensions=(
    "ms-mssql.mssql" # SQL Server extension
)

additional_extensions=(
    "vasubasraj.flashpost" # create api requests for a REST API
    "ms-vsliveshare.vsliveshare" # Live share your code with others
    "grapecity.gc-excelviewer" # Excel viewer
)

# Select the extensions to install
extensions=("${main_extensions[@]}")
# Uncomment the following lines to include additional extensions
# extensions+=("${python_extensions[@]}")
# extensions+=("${sql_extensions[@]}")
# extensions+=("${additional_extensions[@]}")

# Get the list of currently installed extensions
installed=$(code --list-extensions)

# Loop through the extensions and install if not already installed
for ext in "${extensions[@]}"; do
    if echo "$installed" | grep -q "$ext"; then
        echo "$ext already installed."
    else
        echo "Installing $ext ..."
        code --install-extension "$ext"
    fi
done