param (
    [string]$arg0
)

if (-not (Test-Path -Path "build") ) { 
    mkdir "build"
}

# -no-bounds-check -- Use on release builds

# Check if the first argument is "run"
if ($arg0 -eq "run") {
    odin run "src/pong" -debug -strict-style -warnings-as-errors -out:"build\pong.exe"
}
elseif (-not $arg1) {
    # If no argument is passed, just build
    odin build "src/pong" -debug -strict-style -warnings-as-errors -out:"build\pong.exe"
    if ($LastExitCode -eq 0) { 
        Write-Host "Build successful"
    }
}
else {
    Write-Host "Invalid 2nd argument. Use 'run' or no argument."
}
