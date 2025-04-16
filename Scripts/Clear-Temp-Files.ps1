# Clear-Temp-Files.ps1
# Description:
#    This PowerShell script deletes temporary files from the system's temporary directories.
#    It frees up disk space by removing unneeded files in the user's Temp folder and (optionally) the Windows Temp folder.
# 
# How to Test (Dry Run):
#    You can preview which files would be deleted by running this script with the -WhatIf parameter.
#    Example:
#       PS C:\> .\Clear-Temp-Files.ps1 -WhatIf
#    This will list the actions without actually deleting anything.
#
# Usage (Run the Script):
#    1. Save this script as Clear-Temp-Files.ps1.
#    2. Open PowerShell. If you want to clear system-wide temp files, **run PowerShell as Administrator**.
#    3. Navigate to the directory where the script is saved.
#    4. Execute the script:
#       PS C:\> .\Clear-Temp-Files.ps1
# 
#    The script will attempt to delete files in your Temp folder (as the current user). 
#    If running as an administrator, it will also clear the system Temp folder.
#
# Safe Revert Considerations:
#    - This script permanently deletes files (does not send them to Recycle Bin). Ensure that you truly want to remove these files.
#    - Generally, files in Temp directories are safe to delete. The script skips files in use.
#    - If unsure, back up the Temp directories or use -WhatIf mode first.
#    - After running, if any issues arise (e.g., an application missing a temp file), they are usually resolved by the application recreating the needed file. There is typically no need to "revert" the deletion of temp files.
#
# Begin script execution below:

# Set paths for user temp and system temp
$UserTemp = $env:TEMP            # Temp folder for the current user
$SystemTemp = Join-Path $env:WinDir "Temp"   # System-wide Temp folder (e.g., C:\Windows\Temp)

# Determine if the script is running with administrative privileges
$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $IsAdmin) {
    Write-Host "Note: Running without Administrator rights. System temp files will be skipped." -ForegroundColor Yellow
    $DirsToClean = @($UserTemp)
} else {
    $DirsToClean = @($UserTemp, $SystemTemp)
}

foreach ($Dir in $DirsToClean) {
    if (Test-Path $Dir) {
        Write-Host "Cleaning temporary files in $Dir ..." -ForegroundColor Cyan

        try {
            # Get all files and folders within the temp directory and remove them
            Get-ChildItem -Path $Dir -Force -Recurse -ErrorAction SilentlyContinue |
                Remove-Item -Force -Recurse -ErrorAction Continue
            Write-Host "✔ Temp files in '$Dir' have been cleared." -ForegroundColor Green
        }
        catch {
            Write-Host "Some files in '$Dir' could not be deleted (they might be in use). Skipped those." -ForegroundColor Yellow
        }

    } else {
        Write-Host "Skipping: Directory '$Dir' not found." -ForegroundColor Red
    }
}

