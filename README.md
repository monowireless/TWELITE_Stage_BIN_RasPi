# TWELITE_Stage_BIN_RasPi

TWELITE STAGE 配布パッケージに含まれる TWELITE_Stage の実行形式 (RaspberryPi用) です。



## 更新方法

以下の方法で更新します。

1. 以下のリンクから、各リリースバージョンを得ることが出来ます。ZIP形式でダウンロードします。
   https://github.com/monowireless/TWELITE_Stage_BIN_RasPi/releases
2. ダウンロードしたアーカイブを適当な場所に展開します。
3. 現在お使いのTWELITE STAGEを展開したディレクトリより、以下を差し替えます。
   - `TWELITE_Stage???.run`
   - `TWELITE_Stage` ディレクトリ



## 実行形式

#### ファイル名凡例

* `..._fb`: コンソール画面上で動作
* `..._X11`: X11(デスクトップ)画面上で動作
* `..._v6`: ARMv6(Zeroなど)用のライブラリでリンク、フェードエフェクト無効



####  動作確認状況

RaspberryPi OS Buster (32bit版) にてビルド、確認しています。

下表は動作確認状況です。実際の環境で動作するか参考にしてください。

| モデル                     | Zero | Zero | 3B   | 3B   | 4B   | 4B   |
| -------------------------- | ---- | ---- | ---- | ---- | ---- | ---- |
|                            | CON  | X11  | 公７ | X11  | CON  | X11  |
| `TWELITE_Stage_fb.run`     | ✕    | ✕    | 〇   | ✕    | △    | ✕    |
| `TWELITE_Stage_X11.run`    | ✕    | ✕    | ✕    | 〇   | ✕    | 〇   |
| `TWELITE_Stage_fb_v6.run`  | 〇   | ✕    | 〇   | ✕    | △    | ✕    |
| `TWELITE_Stage_X11_v6.run` | ✕    | 〇   | ✕    | 〇   | ✕    | 〇   |

* 公７：公式7インチモニター（コンソール）、CON：HDMI出力（コンソール）、X11(X Window System)
* 〇→動作する
* △→動作はするが難がある。設定等が非常に煩雑である。
* ✕ → 動作しない、動作が期待できない。



※ OSの設定や導入パッケージなどに依存して、動作確認環境であっても動作しない場合も想定されます。動作しない場合は、まずは、RaspberryPi OS を開発時環境にして確認してください。また、サポート対応等は困難な場合があります。予めご了承ください。



## 動作に必要な設定

### 3B,4Bでの設定

https://stage.twelite.info/ 参照



### Zeroでの設定

* UART0 の有効化：raspi-config にて Interface Options -> Serial Port にて有効化しておく。(login shell は無効にする)
  ※ MW-STA-RPi-1 基板では UART0 を用います。
* GL のドライバ：raspi-config にて Advanced Options -> GL Driver にて GL(Full KMS) OpenGL desktop driver with full KMS を有効にしておく。この設定をしておかないと極端に描画が遅くなります。



## ビルド定義

`TWELITE_STAGE_Src/arch_raspi.mk`参照



| makeの定義                | 解説                                                         |
| ------------------------- | ------------------------------------------------------------ |
| `RPI_SDL2_LIB`            | `X11` X Window System用（デスクトップ）<br />`fb`コンソール用 |
| `RPI_ARMv6`               | `RPI_ARMv6=1`とするとARMv6用のライブラリをリンクする(Zeroなど) |
| `MWM5_ENABLE_FADE_EFFECT` | ARMv6用では`0`が設定され、半透明やフェード効果を無効にする。 |



## 更新履歴

[こちら](ReleaseNotes.md)を参照してください。