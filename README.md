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

https://github.com/monowireless/TWELITE_Stage_BIN_RasPi/wiki/Env-1.0.6 参照



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