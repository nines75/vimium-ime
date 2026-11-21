#!/bin/bash

ROOT="$(dirname "$(cargo locate-project --message-format plain)")"
source $ROOT/scripts/config.sh

# ビルド
cargo build --release || exit 1

# プロセス停止
pwsh.exe -Command "Stop-Process -Name '$APP_NAME' -ErrorAction SilentlyContinue"

# バイナリ配置
mkdir -p $INSTALL_PATH
cp $ROOT/target/x86_64-pc-windows-gnu/release/$APP_NAME.exe $ROOT/firefox.json $ROOT/chrome.json $INSTALL_PATH

# レジストリ登録(Firefox)
pwsh.exe -Command "New-Item -Path $REG_PATH_FIREFOX -Force"
pwsh.exe -Command "Set-ItemProperty -Path $REG_PATH_FIREFOX -Name '(default)' -Value $MANIFEST_PATH_FIREFOX"

# レジストリ登録(Chrome)
pwsh.exe -Command "New-Item -Path $REG_PATH_CHROME -Force"
pwsh.exe -Command "Set-ItemProperty -Path $REG_PATH_CHROME -Name '(default)' -Value $MANIFEST_PATH_CHROME"
