#!/bin/bash

rgName="RG-XIAO-EXAMPLE"
vmName="vm-xiao-dev-001"
kvname="kv-xiao"

ssh-keygen -t rsa -b 4096 -C "az vm ssh key" -f ~/.ssh/vm-xiao-dev-001_key -N ""

# 作成した公開鍵を作成したVMに登録する
az vm user update \
  --resource-group $rgName \
  --name $vmName \
  --username xiao_test \
  --ssh-key-value ~/.ssh/vm-xiao-dev-001_key.pub

# キーボールトが存在するかどうかを確認し、存在しない場合は作成する
kvlist=$(az keyvault list --query "[?name=='$kvname']" | jq '. | length')
if [ "${kvlist}" -eq 0 ]; then
  echo "Key Vault $kvname does not exist. Creating..."
  az keyvault create -n $kvname -g $rgName
else
  echo "Key Vault $kvname already exists."
fi

# キーボールトにシークレットを設定する
clientSecretVar="sc-xiao-vm-ssh-key"
az keyvault secret set --vault-name $kvname --name "$clientSecretVar" --file "~/.ssh/vm-xiao-dev-001_key"
