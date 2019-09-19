require 'kafka'

brokers = ['kafka-broker-1:9092', 'kafka-broker-2:9092', 'kafka-broker-3:9092']

kafka = Kafka.new(brokers)

consumer = kafka.consumer(group_id: 'consumerapp')

topic = 'learn-kafka-topic'

consumer.subscribe(topic)

# consumer.subscribe(topic2)

trap('TERM') { consumer.stop }

consumer.each_message do |message|
  puts "Topic: #{message.topic}"
  puts "Partition: #{message.partition}"
  puts "Offset: #{message.offset}"
  puts "Key: #{message.key}"
  puts "Value: #{message.value}"
  puts "-------\n"
end
