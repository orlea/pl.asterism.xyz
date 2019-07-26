# pl.asterism.xyz

pl.asterism.xyzの設定ファイルや運用スクリプト

Pleroma instance on one AWS Lightsail + Wasabi(Alt AWS S3) + Cloudflare CDN

## 構成

- Pleroma本体とPostgreSQLはネイティブにインストール
- リバースプロキシはnginx + certbot
- Lightsail $3.5 RAM512MB, vCPU1core
- メディア用にWasabi S3バケットとCloudflareを使用
- カスタム絵文字もバケットをrcloneでsync
- データベースと設定ファイルのバックアップはS3へ転送し、バージョニングとライフサイクルを使い世代管理
