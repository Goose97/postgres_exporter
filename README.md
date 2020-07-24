### Hướng dẫn cài đặt
```
wget https://statics.pancake.vn/thanos-test/cakecloud-postgres-exporter.tar.gz
tar -xvf cakecloud-postgres-exporter.tar.gz
cd postgres-exporter
make project=<PROJECT_NAME> database_user=<USER> database_password=<PASSWORD> database_name=<DB_NAME> port=<PORT>
```
