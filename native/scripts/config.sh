USER_PROFILE=$(powershell.exe -Command '$env:UserProfile' | tr -d "\r")
USER_PROFILE_WSL=$(wslpath $USER_PROFILE)

APP_NAME=vimium-ime-native
REG_NAME=vimium.ime.native

INSTALL_PATH=$USER_PROFILE_WSL/$REG_NAME
MANIFEST_PATH="$USER_PROFILE\\$REG_NAME\\$REG_NAME.json"
REG_PATH="HKCU:\Software\Mozilla\NativeMessagingHosts\\$REG_NAME"
