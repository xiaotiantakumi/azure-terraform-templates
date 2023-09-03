# usernameとpasswordを設定して、setup.shと名前を変更して下さい。
# setup.shはgitにコミットしないで下さい。(gitignoreにいれています。)
export TF_VAR_vm_admin_username="test"
export TF_VAR_vm_admin_password="p@ssw0rd1234"

# 再起的にフォーマットする
terraform fmt -recursive

# 初期化からリソース作成まで
terraform init
terraform plan -out plan.out
terraform apply plan.out

# リソース削除
# terraform destroy

# リソース作成後、azコマンドでvmのssh接続の設定を実行させる
# まずは秘密鍵を作成する。-Nでパスフレーズを設定するが、空のパスフレーズなので鍵はパスフレーズなしとなる。
ssh-keygen -t rsa -b 4096 -C "comment" -f ~/.ssh/vm-xiao-dev-001_key_key -N ""