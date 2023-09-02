#!/bin/bash

kvname="kv-xiao"
# キーボールトが存在するかどうかを確認し、存在しない場合は作成する
kvlist=$(az keyvault list --query "[?name=='$kvname']" | jq '. | length')
if [ "${kvlist}" -eq 0 ]; then
  echo "Key Vault $kvname does not exist. Creating..."
  az keyvault create -n $kvname -g $rgName
else
  echo "Key Vault $kvname already exists."
fi

# キーボールトにシークレットを設定する
clientSecretVar="sc-xiao-client-secret"
az keyvault secret set --vault-name $kvname --name "$clientSecretVar" --value ""
