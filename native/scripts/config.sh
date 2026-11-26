HOME_PATH=$(pwsh.exe -Command '$env:UserProfile' | tr -d "\r")
HOME_PATH_WSL=$(wslpath "$HOME_PATH")

APP_NAME=vimium-ime-native
REG_NAME=vimium.ime.native

INSTALL_PATH=$HOME_PATH_WSL/$REG_NAME

MANIFEST_PATH_FIREFOX="$HOME_PATH\\$REG_NAME\firefox.json"
MANIFEST_PATH_CHROME="$HOME_PATH\\$REG_NAME\chrome.json"

REG_PATH_FIREFOX="HKCU:\Software\Mozilla\NativeMessagingHosts\\$REG_NAME"
REG_PATH_CHROME="HKCU:\Software\Google\Chrome\NativeMessagingHosts\\$REG_NAME"
