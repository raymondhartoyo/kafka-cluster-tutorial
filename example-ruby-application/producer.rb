require 'kafka'

brokers = ['kafka-broker-1:9092', 'kafka-broker-2:9092', 'kafka-broker-3:9092']

kafka = Kafka.new(brokers, client_id: 'producerapp')

producer = kafka.producer

topic = 'learn-kafka-topic'

(1..300).each do |i|
  producer.produce("hello #{i}", key: i, topic: topic)
end

producer.deliver_messages
