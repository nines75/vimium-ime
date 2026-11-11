#!/bin/bash

ROOT="$(dirname "$(cargo locate-project --message-format plain)")"
source $ROOT/scripts/config.sh

# プロセス停止
powershell.exe -Command "Stop-Process -Name '$APP_NAME' -ErrorAction SilentlyContinue"

# バイナリ削除
rm -rf $INSTALL_PATH

# レジストリ削除
powershell.exe -Command "if (Test-Path $REG_PATH_FIREFOX) { Remove-Item -Path $REG_PATH_FIREFOX -Recurse }"
powershell.exe -Command "if (Test-Path $REG_PATH_CHROME) { Remove-Item -Path $REG_PATH_CHROME -Recurse }"
