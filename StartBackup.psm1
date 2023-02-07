# StartBackup

if (-not(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
	echo "[FAIL] 実行には管理権限が必要"
	exit
}

Log "Start Backup"

WBADMIN START BACKUP -backupTarget:e: -include:c:,d: -allCritical -vssFull -quiet

if( $LASTEXITCODE -eq 0 ){
	Log "End Backup"
}
else{
	Log "Fail Backup"
}

Stop-Computer -Force
