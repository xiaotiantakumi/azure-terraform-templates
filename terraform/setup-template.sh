# usernameとpasswordを設定して、setup.shと名前を変更して下さい。
# setup.shはgitにコミットしないで下さい。(gitignoreにいれています。)
export TF_VAR_vm_admin_username="test"
export TF_VAR_vm_admin_password="p@ssw0rd1234"

terraform init
terraform plan -out plan.out
terraform apply plan.out
# リソース削除
# terraform destroy