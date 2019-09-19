docker container run -it --name kafka-broker-1 -p :9092 ubuntu /bin/bash

apt-get update && apt-get install -y wget nano openjdk-8-jdk

wget https://www-us.apache.org/dist/kafka/2.3.0/kafka_2.12-2.3.0.tgz

tar -xzf kafka_2.12-2.3.0.tgz

mv kafka_2.12-2.3.0 /opt/kafka

cd /opt/kafka

mkdir /var/kafka-logs

echo "
broker.id=0
log.dirs=/var/kafka-logs
log.retention.hours=168
zookeeper.connect=zookeeper-1:2181,zookeeper-2:2181,zookeeper-3:2181

advertised.listeners=PLAINTEXT://kafka-broker-1:9092
" > config/server.properties

bin/kafka-server-start.sh config/server.properties
