require "drb/drb"
require "./common"

STDOUT.sync = true
sleep(0.2) # wait for server to be up

URL = "druby://localhost:10567"
puts "Starting client at #{Process.pid}"
DRb.start_service
queue = DRbObject.new_with_uri(URL)

loop do
  value = queue.pull
  break if value.nil?

  puts "[#{Process.pid}] Got value: #{value.respond_to?(:json_payload) ? value.json_payload : value.inspect}"
  sleep (rand(500) + 500)/1000.0
end
