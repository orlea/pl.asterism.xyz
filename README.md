# pl.asterism.xyz

pl.asterism.xyzの設定ファイルや運用スクリプト

Pleroma instance on Docker swarm on AWS EC2 + AWS S3 + Cloudflare CDN

## 構成

- https://blog.asterism.xyz/posts/2019-08-01/
- mstdn.asterism.xyzに同居
- メディア用にS3とCloudflareを使用
- カスタム絵文字やpleroma設定ファイルはAWS EFSを使用
- データベースのバックアップはS3へ転送し、バージョニングとライフサイクルを使い世代管理

## LICENSE

Dockerfileは以下からforkしています。

https://github.com/angristan/docker-pleroma
