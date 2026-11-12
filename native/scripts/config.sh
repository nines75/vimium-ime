USER_PROFILE=$(powershell.exe -Command '$env:UserProfile' | tr -d "\r")
USER_PROFILE_WSL=$(wslpath $USER_PROFILE)

APP_NAME=vimium-ime-native
REG_NAME=vimium.ime.native

INSTALL_PATH=$USER_PROFILE_WSL/$REG_NAME

MANIFEST_PATH_FIREFOX="$USER_PROFILE\\$REG_NAME\firefox.json"
MANIFEST_PATH_CHROME="$USER_PROFILE\\$REG_NAME\chrome.json"

REG_PATH_FIREFOX="HKCU:\Software\Mozilla\NativeMessagingHosts\\$REG_NAME"
REG_PATH_CHROME="HKCU:\Software\Google\Chrome\NativeMessagingHosts\\$REG_NAME"
