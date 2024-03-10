# モジュール名
$ModuleName = "StartBackup"

# Module Path
if(($PSVersionTable.Platform -eq "Win32NT") -or ($PSVersionTable.Platform -eq $null)){
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"
}else{
$ModulePath = Join-Path ($env:HOME) "/.local/share/powershell/Modules"}

$NewPath = Join-Path $ModulePath $ModuleName

# Make Directory
if( -not (Test-Path $NewPath)){
	New-Item $NewPath -ItemType Directory -ErrorAction SilentlyContinue
}

# Copy Module
$ModuleFileName = Join-Path $PSScriptRoot ($ModuleName + ".psm1")
Copy-Item $ModuleFileName $NewPath
