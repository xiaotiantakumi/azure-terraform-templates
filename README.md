# Introduction 
terraformを使ってAzureの環境を構築するためのサンプルコードです。

# このブランチについて
このブランチは、terraformのコードを使ってVMとBastionを構築するためのサンプルです。
Bastionでの接続には、keyvaultに設定したSSH秘密キーを使います。

SSH秘密キーの作成方法についてはこちらを参照
https://learn.microsoft.com/ja-jp/azure/virtual-machines/linux/mac-create-ssh-keys


実際にterraformで環境を構築する場合はsetup-template.shを確認して下さい。