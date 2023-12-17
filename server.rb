require "drb/drb"
require "./common"

STDOUT.sync = true
URL = "druby://localhost:10567"

require 'json'

class Queue
  def initialize
    @queue = []
  end

  def push(stuff)
    @queue << stuff
  end

  def pull
    @queue.shift
  end
end

queue = Queue.new
queue.push Event.new("test")
queue.push Event.new(test: true)
queue.push :test

10.times { queue.push(Event.new(rand_num: rand(100)))}

puts "Starting server..."
DRb.start_service(URL, queue)

loop { nil }
