# pl.asterism.xyz

pl.asterism.xyzの設定ファイルや運用スクリプト

Pleroma instance on Docker swarm + Wasabi(Alt AWS S3) + Cloudflare CDN

## 構成

- https://blog.asterism.xyz/posts/2019-08-01/
- mstdn.asterism.xyzに同居
- メディア用にWasabiとCloudflareを使用
- カスタム絵文字やpleroma設定ファイルはEFSを使用
- データベースのバックアップはS3へ転送し、バージョニングとライフサイクルを使い世代管理
