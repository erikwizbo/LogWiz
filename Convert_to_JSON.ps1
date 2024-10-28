# Define paths with an absolute path to the .evtx file
$inputFilePath = "C:\Users\jackw\OneDrive\Documents\ComputerSecurity\computerlogs_security.evtx"
$outputFolder = "C:\Users\jackw\OneDrive\Documents\ComputerSecurity\ConvertedLogs"
$outputFileName = "computerlogs_security.json"
$outputFilePath = Join-Path -Path $outputFolder -ChildPath $outputFileName

# Check if the .evtx file exists
if (!(Test-Path -Path $inputFilePath)) {
    Write-Output "Error: Input file not found at $inputFilePath"
    exit
} else {
    Write-Output "File found at $inputFilePath, proceeding with conversion..."
}

# Ensure the output folder exists
if (!(Test-Path -Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder
}

# Convert .evtx to JSON and save to output folder
try {
    Get-WinEvent -FilterHashtable @{LogName="Security"} | ForEach-Object {
        $_ | Select-Object TimeCreated, Id, LevelDisplayName, Message, ProviderName | ConvertTo-Json -Compress
    } | Out-File -FilePath $outputFilePath -Encoding utf8
    Write-Output "Conversion complete! JSON file saved to $outputFilePath"
} catch {
    Write-Output "Error during conversion: $_"
}

