hostname = $(shell hostname)
instance_id = $(shell curl "http://10.1.9.49:4001/api/instance_id?name=${hostname}&project_name=${project}")
DATA_SOURCE_NAME="postgresql://${database_user}:${database_password}@localhost:${port}/${database_name}"
PG_EXPORTER_CONSTANT_LABELS="domain=${instance_id}_${hostname}"

all: prepare_files save_env_vars start_service

prepare_files:
	mkdir -p ./vars
	cp -r ../postgres_exporter ~ 2>/dev/null || :
	sudo cp -r ./cakecloud-postgres-exporter.service /etc/systemd/system/

save_env_vars:
	echo $(DATA_SOURCE_NAME) > vars/DATA_SOURCE_NAME
	echo $(PG_EXPORTER_CONSTANT_LABELS) > vars/PG_EXPORTER_CONSTANT_LABELS

start:
	export DATA_SOURCE_NAME=$(shell cat ./vars/DATA_SOURCE_NAME); \
	export PG_EXPORTER_CONSTANT_LABELS=$(shell cat ./vars/PG_EXPORTER_CONSTANT_LABELS); \
	./postgres_exporter

start_service:
	sudo systemctl enable cakecloud-postgres-exporter.service
	sudo systemctl start cakecloud-postgres-exporter.service
