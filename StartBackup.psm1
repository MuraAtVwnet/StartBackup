# StartBackup

function Log(
            $LogString
            ){

    # ログの出力先
    $LogPath = "C:\Log"

    # ログファイル名
    $LogName = "BackupLog"

    $Now = Get-Date

    # Log 出力文字列に時刻を付加(YYYY/MM/DD HH:MM:SS.MMM $LogString)
    $Log = $Now.ToString("yyyy/MM/dd HH:mm:ss.fff") + " "
    $Log += $LogString

    # ログファイル名が設定されていなかったらデフォルトのログファイル名をつける
    if( $LogName -eq $null ){
        $LogName = "LOG"
    }

    # ログファイル名(XXXX_YYYY-MM-DD.log)
    $LogFile = $LogName + "_" +$Now.ToString("yyyy-MM-dd") + ".log"

    # ログフォルダーがなかったら作成
    if( -not (Test-Path $LogPath) ) {
        New-Item $LogPath -Type Directory
    }

    # ログファイル名
    $LogFileName = Join-Path $LogPath $LogFile

    # ログ出力
    Write-Output $Log | Out-File -FilePath $LogFileName -Encoding Default -append

    # echo させるために出力したログを戻す
    Return $Log
}



if (-not(([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))) {
	echo "[FAIL] 実行には管理権限が必要"
	exit
}

Log "Start Backup"

WBADMIN START BACKUP -backupTarget:f: -include:c:,d:,e: -allCritical -vssFull -quiet

if( $LASTEXITCODE -eq 0 ){
	Log "End Backup"
}
else{
	Log "Fail Backup"
}

Stop-Computer -Force
