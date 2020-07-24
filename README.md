### Hướng dẫn cài đặt
```
wget https://statics.pancake.vn/bucket-s3/text/cakecloud-postgres-exporter.tar.gz
tar -xvf cakecloud-postgres-exporter.tar.gz
cd postgres_exporter
make project=<PROJECT_NAME> database_user=<USER> database_password=<PASSWORD> database_name=<DB_NAME> port=<PORT>
```
