# This script will install all the extensions listed in the $extensions array.

$main_extensions = (
    "mhutchie.git-graph", # Git graph
    "github.copilot", # GitHub copilot
    "github.copilot-chat", # GitHub copilot chat
    "ms-azuretools.vscode-docker", # Docker
    "ms-vscode-remote.remote-containers", # dev container support
    "ms-vscode-remote.remote-ssh" # SSH support
)

$python_extensions = (
    "ms-python.python", # Main python extension
    "ms-python.isort", # Sort imports for python
    "ms-python.black-formatter", # Black formatter for python
    "ms-toolsai.jupyter" # Jupyter notebook support
)

$sql_extensions = (
    "ms-mssql.mssql" # SQL Server extension
)

$additional_extensions = (
    "vasubasraj.flashpost", # create api requests for a REST API
    "ms-vsliveshare.vsliveshare", # Live share your code with others
    "grapecity.gc-excelviewer" # Excel viewer
)

# select the extensions to install
$extensions = $main_extensions #+
#    $python_extensions +
#    $sql_extensions +
#    $additional_extensions

$cmd = "code --list-extensions"
Invoke-Expression $cmd -OutVariable output | Out-Null
$installed = $output -split "\s"

foreach ($ext in $extensions) {
    if ($installed.Contains($ext)) {
        Write-Host $ext "already installed." -ForegroundColor Gray
    } else {
        Write-Host "Installing" $ext "..." -ForegroundColor White
        code --install-extension $ext
    }
}