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
docker run -p 8080:8080 kafka-connector
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
