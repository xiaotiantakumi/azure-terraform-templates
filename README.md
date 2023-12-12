# プロジェクト概要

このプロジェクトは、Terraform を使用して Azure のリソースを構築するためのサンプルコード集です。異なる種類のリソースを効率的に管理し、デプロイすることが可能です。

# ブランチについて

このリポジトリは、Azure のさまざまなリソースについての理解を深めるため、各ブランチで異なるサンプルプロジェクトを提供しています。以下は、現在利用可能なブランチとその内容の概要です：

- `main`: 現在のブランチ。基本的なプロジェクトの構造と使用方法を提供。
- `bastion_basic`: Azure Bastion サービスの基本的な使用法を紹介するサンプル。
- `bastion_ssh_keyvault`: Azure Bastion を使って Key Vault に保存された SSH キーを利用する方法をデモンストレーション。
- `vm_basic`: Azure Virtual Machines の基本的な設定とデプロイ方法を示すサンプル。

各ブランチは、特定の Azure サービスまたは概念に焦点を当てており、実践的な学習と深い理解を支援することを目的としています。適切なブランチをチェックアウトして、それぞれのサンプルを試してみてください。

## プロジェクト構造

- `terraform/`: Terraform の主要な設定ファイルが含まれています。
  - `main.tf`: リソースグループとその他の Azure リソースの定義。
  - `outputs.tf`: 出力変数の定義。
  - `variables.tf`: プロジェクトで使用する変数の定義。
  - `terraform.tfvars`: デフォルトの変数値を設定。
  - `providers.tf`: Terraform プロバイダーの設定。

## 前提条件

- Terraform v1.3.0 以上
- Azure アカウントと基本的な Azure の知識

## 使用方法

1. `terraform` ディレクトリに移動します。
   ```bash
   cd terraform
   ```
2. Terraform を初期化します。
   ```bash
   terraform init
   ```
3. プランを作成し、適用します。
   ```bash
   terraform plan -out plan.out
   terraform apply plan.out
   ```

## クリーンアップとリソース削除

リソースを削除するには、以下のコマンドを実行します。

```bash
terraform destroy
```

## FAQ またはトラブルシューティング

### terraform コマンドを実行する場所

実行する場所に注意しましょう。
本プロジェクトの root ディレクトリではなく、terraform ディレクトリで実行してください。

```bash
cd terraform
terraform init
```
