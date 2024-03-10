# モジュール名
$ModuleName = "StartBackup"

# Module Path
if(($PSVersionTable.Platform -eq "Win32NT") -or ($PSVersionTable.Platform -eq $null)){
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"
}else{
$ModulePath = Join-Path ($env:HOME) "/.local/share/powershell/Modules"}
$RemovePath = Join-Path $ModulePath $ModuleName

# Remove Direcory
if( Test-Path $RemovePath ){
	Remove-Item $RemovePath -Force -Recurse
}
