# Vimium-IME

Vimiumで、Vomnibarを開いたときIMEをオフにする

Windowsのみ対応しています

## インストール

### 要件

- pnpm
- WSL
- Rust (`x86_64-pc-windows-gnu`をターゲットとしてビルドできること)

### Firefox

> [!WARNING]
> 未署名のアドオンを使用するためには、対応するFirefoxと設定の変更が必要です  
> 詳細は[こちら](https://support.mozilla.org/ja/kb/add-on-signing-in-firefox#w_wei-shu-ming-noadoonwoshi-itaichang-he-shang-ji-yu-za-xiang-ke)を参照してください

1. `pnpm install`
2. `pnpm zip`
3. `about:addons`から`.output/firefox.xpi`を読み込む

### Chrome

> [!WARNING]
> ステップ3でWSL上のフォルダを読み込んだ場合、Chromeが起動するたびにWSLも起動します  
> そのため、生成されたchrome-mv3をWSL外にコピーしたうえでChromeに読み込むことをお勧めします

1. `pnpm install`
2. `pnpm build:chrome`
3. `chrome://extensions`から`.output/chrome-mv3`を読み込む

### ネイティブメッセージングホスト

WSL上で実行する必要があります

```sh
cd native/scripts
./install-wsl.sh
```
