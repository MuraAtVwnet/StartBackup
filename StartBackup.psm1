# StartBackup

if (-not(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
	echo "[FAIL] 実行には管理権限が必要"
	exit
}

WBADMIN START BACKUP -addtarget:e: -include:D:,C: -allCritical -vssFull -quiet
Stop-Computer -Force
