# Vimium-IME

Vimiumで、Vomnibarを開いたときIMEをオフにする

Windowsのみ対応しています

## インストール

### 要件

- pnpm
- WSL
- Rust (`x86_64-pc-windows-gnu`をターゲットとしてビルドできること)

### Firefox

1. `pnpm install`
2. `pnpm zip`
3. `about:addons`から`.output/firefox.xpi`を読み込む

### Chrome

1. `pnpm install`
2. `pnpm build:chrome`
3. `chrome://extensions`から`.output/chrome-mv3`を読み込む

### ネイティブメッセージングホスト

WSL上で実行する必要があります

```sh
cd native/scripts
./install-wsl.sh
```
