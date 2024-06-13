# 手順

msk構築
```
cd terraform_kafka/vpc/dev
terraform init
terraform plan
terraform apply

cd terraform_kafka/msk/dev
terraform init
terraform plan
terraform apply
```

```
git clone https://git.zabbix.com/scm/zt/kafka-connector.git
vi Dockerfile

docker build -t kafka-connector .
docker run -d -p 8080:8080 kafka-connector:latest

# Zabbix webでconnector作成

https://www.zabbix.com/documentation/7.0/en/manual/config/export/streaming#configuration

# 

docker exec -it 6b6a254169e9 sh
zabbix_server -R config_cache_reload
```

## kafka_connector.conf

confファイル各プロパティ：

https://git.zabbix.com/projects/ZT/repos/kafka-connector/browse

kafka connector:

- Connector.Port: Kafka connector server port
- Connector.LogType: The log output type of Kafka connector.
- Connector.LogFile
- Connector.LogFileSize
- Connector.LogLevel
- Connector.BearerToken: Authorization token for incoming connections from Zabbix server.
- Connector.AllowedIP
- Connector.EnableTLS
- Connector.CertFile
- Connector.KeyFile
- Connector.Timeout

Kafka connector producer settings:

- Kafka.URL
- Kafka.Port
- Kafka.Events
- Kafka.Items
- Kafka.Retry
- Kafka.Timeout
- Kafka.KeepAlive
- Kafka.Username
- Kafka.Password
- Kafka.EnableTLS
- Kafka.TLSAuth
- Kafka.CaFile
- Kafka.ClientCertFile
- Kafka.ClientKeyFile

# 参考

- https://www.sraoss.co.jp/tech-blog/zabbix/zabbix64-newfeature-latest/

## 

docker exec -it fe56671894cf bash
/opt/bitnami/kafka/bin/kafka-console-producer.sh --broker-list 172.31.27.14:9092 --topic events

docker exec -it {bitnami/kafka Container ID} bash
/opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server 172.0.0.1:9092 --topic items  --from-beginning

/opt/bitnami/kafka/bin/kafka-topics.sh --create --bootstrap-server 172.31.27.14:9092 --topic items --partitions 1 --replication-factor 1


client.properties
```
key.serializer=org.apache.kafka.common.serialization.StringSerializer
value.serializer=org.apache.kafka.common.serialization.StringSerializer
key.deserializer=org.apache.kafka.common.serialization.StringDeserializer
value.deserializer=org.apache.kafka.common.serialization.StringDeserializer
security.protocol=PLAINTEXT
```

```
# トピック作成
./kafka-topics.sh --create --bootstrap-server b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092 --command-config client.properties --replication-factor 2 --partitions 1 --topic MSKTutorialTopic

# データを生成及び消費する
./kafka-console-producer.sh --broker-list b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092 --producer.config client.properties --topic MSKTutorialTopic
./kafka-console-consumer.sh --bootstrap-server b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092 --consumer.config client.properties --topic MSKTutorialTopic --from-beginning

# itemsトピック作成
./kafka-topics.sh --create --bootstrap-server b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092 --command-config client.properties --replication-factor 2 --partitions 1 --topic items

# itemsトピックメッセージを確認
./kafka-console-consumer.sh --bootstrap-server b-1.exdev.ql7lgu.c6.kafka.us-west-2.amazonaws.com:9092 --consumer.config client.properties --topic items --from-beginning
```
