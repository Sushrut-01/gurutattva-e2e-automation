$currentPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$javaPath = 'C:\Program Files\Java\jdk-25\bin'

if ($currentPath -notlike "*$javaPath*") {
    $newPath = $currentPath + ";$javaPath"
    [Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
    Write-Host "Added Java to PATH successfully"
} else {
    Write-Host "Java already in PATH"
}

# Verify
Write-Host "Current JAVA_HOME: $([Environment]::GetEnvironmentVariable('JAVA_HOME', 'User'))"
Write-Host "Java in PATH: $([Environment]::GetEnvironmentVariable('Path', 'User') -like '*Java*jdk-25*')"
