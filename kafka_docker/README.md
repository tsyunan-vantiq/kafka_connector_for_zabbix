```
docker exec -it fe56671894cf bash
/opt/bitnami/kafka/bin/kafka-console-producer.sh --broker-list 172.31.27.14:9092 --topic events

docker exec -it {bitnami/kafka Container ID} bash
/opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server 172.0.0.1:9092 --topic items  --from-beginning

/opt/bitnami/kafka/bin/kafka-topics.sh --create --bootstrap-server 172.31.27.14:9092 --topic items --partitions 1 --replication-factor 1
```
