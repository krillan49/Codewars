#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement an EventEmitter class with two methods, on() and trigger().
#
# On allows you to 'subscribe' to an event, passing in a key as a parameter, and a Ruby block to be executed when this particular event is triggered.
#
# The trigger method accepts a key as a parameter. The trigger method calls all blocks that have been subscribed to the key parameter. This method should return an array of all of the blocks for the key parameter.
#
# triggering a key which has no subscribed blocks should return an empty array.
#
# e = EventEmitter.new
# e.trigger('key')
# # => []
# For the solution to be correct, you must be able to subscribe n number of blocks to the same key:
#
# e = EventEmitter.new
#
# e.on('foo') { puts 'foo' }
# e.on('foo') { puts 'bar' }
# e.on('foo') { puts 'baz' }
#
# e.trigger('foo')
# # => 'foo'
# # => 'bar'
# # => 'baz'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class EventEmitter
  def initialize
    @blocks = {}
  end

  def on(key, &block)
    @blocks[key] ? @blocks[key] << block : @blocks[key] = [block]
  end

  def trigger(key)
    @blocks[key] ? @blocks[key].each(&:call) : []
  end
end
