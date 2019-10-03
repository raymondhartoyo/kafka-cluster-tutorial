docker container run -it --name zookeeper-3 -p :2181 --network tutorial-kafka ubuntu /bin/bash

apt-get update && apt-get install -y wget nano openjdk-8-jdk

wget https://www-us.apache.org/dist/kafka/2.3.0/kafka_2.12-2.3.0.tgz

tar -xzf kafka_2.12-2.3.0.tgz

mv kafka_2.12-2.3.0 /opt/kafka

cd /opt/kafka

mkdir /var/zookeeper

echo "
tickTime=2000
dataDir=/var/zookeeper/
clientPort=2181
initLimit=5
syncLimit=2

server.1=zookeeper-1:2888:3888
server.2=zookeeper-2:2888:3888
server.3=zookeeper-3:2888:3888
" > config/zookeeper.properties

echo "3" > /var/zookeeper/myid

bin/zookeeper-server-start.sh config/zookeeper.properties
