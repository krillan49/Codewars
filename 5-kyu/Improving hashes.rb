#===============================================================================================================
#                                               Description
#===============================================================================================================

# Well, you probably already are familiar with hashes. But, well, I want to access hash values through a diferent way, I really do not like to use the [] method.
#
# Here's how I want to access the values:
#
# hash = {a: 2, b: 1, c: 0.5}
#
# hash.a # must return the same as hash[:a]
# hash.b # must return the same as hash[:b]
# hash.c # must return the same as hash[:c]
# But there is some things that you may be aware:
#
# If the hash already has a method with the key name, the existent method must be kept (e.g. {size: 5}.size must return the hash size, and not the value)
# If the hash doens't include the key, you must return the that call an inexistent method in hash (e.g. hash = {a: 1}; hash.b must throw the NoMethodError exception)
# String keys should work as well (e.g. {'a' => 'b'}.a must return 'b')
# Some tips:
#
# You must reopen the Hash class
# Try to do with the less code as possible

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Hash
  def method_missing name
    if self.key?(name)
      self[name]
    elsif self.key?("#{name}")
      self["#{name}"]
    else
      raise NoMethodError
    end
  end
end
