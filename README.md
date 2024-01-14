# プロジェクト概要

このプロジェクトは、Terraform を使用して Azure のリソースを構築するためのサンプルコード集です。異なる種類のリソースを効率的に管理し、デプロイすることが可能です。

# このブランチについて

この Branch では、既にあるリソースグループと Application Insights を利用して、Azure Functions をデプロイします。
data ブロックを利用して、既存のリソースを参照しています。

## プロジェクト構造

- `terraform/`: Terraform の主要な設定ファイルが含まれています。

  - `main.tf`: リソースグループとその他の Azure リソースの定義。
  - `outputs.tf`: 出力変数の定義。
  - `variables.tf`: プロジェクトで使用する変数の定義。
  - `terraform.tfvars`: デフォルトの変数値を設定。
  - `providers.tf`: Terraform プロバイダーの設定。

- `terraform/modules/`: モジュールの定義。
  - `functions/`: Azure Functions をデプロイするためのモジュール。
    - `main.tf`: Azure Functions をデプロイするための設定ファイル。
    - `outputs.tf`: 出力変数の定義。
    - `variables.tf`: モジュールで使用する変数の定義。
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
2. init_terraform.sh を実行します。
   source としているのは、環境変数を設定するためです。

   ```bash
   source ../init_terraform.sh
   ```

3. Terraform を初期化します。
   ```bash
   terraform init
   ```
4. プランを作成し、適用します。
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

### 詳しいログを出力する

```bash
export TF_LOG="DEBUG"
```

デフォルトの状態に戻す

```bash
unset TF_LOG
```

### terraform コマンドを実行する場所

実行する場所に注意しましょう。
本プロジェクトの root ディレクトリではなく、terraform ディレクトリで実行してください。

```bash
cd terraform
terraform init
```
