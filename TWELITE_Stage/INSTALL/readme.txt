[raspi/set_udev_sudo.sh]
  MONOSTICKやTWELITE-Rの標準USBドライバにユーザーのアクセス許可を与え、
  また、標準ドライバをアンロード設定を行うスクリプトです。
  ルート権限が必要で /etc/udev/rules.d/ にファイルを作成します。

 
  $ cd ./raspi
  $ sudo ./set_udev_sudo.sh

  ※ MW-STA-RPi-1 を用いるなど RaspberryPi の拡張ピンより UART0 を仕様
     する場合は、この設定は不要です。
 
  ※ この設定では、デバイス装着時に一旦 ftdi_sio, usbserial がロード
     されますが強制的に rmmod します。他に上記ドライバを利用するデバ
     イスが接続されている場合はご注意下さい。

  ※ この定義が無いとユーザ権限で FTDI デバイスにアクセスできない場合が
     あります。(sudo ./TWELITE_Stage???.run で実行した場合は MONOSTICKや
     TWELITE-Rが確認できるのに、ユーザ実行では見えない）