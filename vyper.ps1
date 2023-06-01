Write-Host "1 - Only Compile"
Write-Host "2 - Deploy"
Write-Host "3 - Install Dependencies"
$choice = Read-Host "Enter your choice (1 , 2 or 3): "

if ($choice -eq "1") {
    # Only Compile
    if (-not (Test-Path "compiler.py")) {
        Write-Host "compiler.py file not found."
        exit 1
    }
    Write-Host "Running compiler ..."
    python3 compiler.py
    Write-Host "Contract compiled successfully..."
} elseif ($choice -eq "2") {
    # Deploy
    if (-not (Test-Path "compiler.py")) {
        Write-Host "compiler.py file not found."
        exit 1
    }
    Write-Host "Running compiler ..."
    python3 compiler.py
    Write-Host "Contract compiled successfully..."
    npx tsc
    node --no-warnings deployer.js
    Remove-Item -Path "deployer.js" -Force
} elseif ($choice -eq "3") {
     pip install vyper
     npm install
  }else {
    Write-Host "Invalid choice. Please enter 1 , 2 or 3."
    exit 1
}