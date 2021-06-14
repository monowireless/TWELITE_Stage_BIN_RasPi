*** Raspberry Pi OS ***

[代表的な環境]
  開発には以下を用いています。
  Hardware:
    Raspberry Pi 3 Model B
  LCD Screen:
    Raspberry Pi Touch Display (7")
  OS:
    Raspberry PI OS (32bit) Lite
    Version:August 2020

[インストールと実行]
  アーカイブファイルを適当な場所(空白や日本語文字列が含まれるパスは不可)
  に展開します。

  $ cd /home/pi
  $ unzip MWSTAGE2020_10_raspi.zip

  MWSTAGEディレクトリが作成されるので、TWELITE_Stage.run を実行します。
  $ cd MWSTAGE
  $ ./TWELITE_Stage.run

[raspi/set_udev_sudo.sh]
  MONOSTICKやTWELITE-Rの標準USBドライバにユーザーのアクセス許可を与え、
  また、標準ドライバをアンロード設定を行うスクリプトです。
  ルート権限が必要で /etc/udev/rules.d/ にファイルを作成します。
 
  $ cd ./raspi
  $ sudo ./set_udev_sudo.sh

  ※ この設定では、デバイス装着時に一旦 ftdi_sio, usbserial がロード
     されますが強制的に rmmod します。他に上記ドライバを利用するデバ
     イスが接続されている場合はご注意下さい。

[UART]
  上述の環境では、raspi-config よりシリアルポートの設定をすることで
  /dev/serial0 が利用可能になります。

  $ sudo raspi-config

  メニューより
  "3 Interface Options    Configure connections to peripherals"
  →"P6 Serial Port Enable/disable shell messages on the serial connection"

  以下のようにログインシェルとしては利用しない、ハードウェアを有効化する
  を選択します。
  "Would you like a login shell to be accessible over serial?" -> <No>
  "Would you like the serial port hardware to be enabled?" → <Yes>

  配線例を以下に挙げます。
      [TWELITE]               [RaspberryPi]
       GND  ------------------ Gound (#6,#9,#14,#20,#25,#30,#34,#39のいずれか)
       TXD(DIO6,DIP#10) ------ GPIO15/UART0 RXD (#10)
       PRG(SPIMISO,DIP#7) ---- GPIO23 (#16)
       RXD(DIO7,DIP#3) ------- GPIO14/UART0 TXD (#8)
       RST(RESETN,DIP#21) ---- GPIO22 (#15)
       VCC  ------------------ 3V3 (#1,#17のいずれか)
       SET(DIO12,DIP#15) ----- GPIO12 (#32)

   * TWELITE, RaspberryPi ともに製造元のマニュアルを参照ください。
   * DIP# は TWELITE DIP のピン番号です。
   * 上記配線は TWELITE 無線マイコンモジュールが安定稼働することを保証する
     ものではありません。

[その他 - /dev/dri/]
  TWELITE_Stage.run 起動時に以下のエラーが出る場合があります。
  "The path /dev/dri/ cannot be opened or is not available"

  無視しても構いませんが、エラーを抑制したい場合は当該名のディレクトリを
  作成します。
  (ディレクトリを作成することで別の影響が発生する可能性があります)
  $ sudo mkdir /dev/dri
