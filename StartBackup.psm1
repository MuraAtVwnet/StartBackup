# StartBackup

if (-not(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
	echo "[FAIL] 実行には管理権限が必要"
	exit
}

WBADMIN START BACKUP -backupTarget:e: -include:c:,d: -allCritical -vssFull -quiet

Stop-Computer -Force
