#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a custom class called CustomHash that is a subclass of Hash, and implement a method #get_bool on it.
#
# get_bool accepts one parameter (a string), and returns the boolean value of the corresponding key (a symbol) in the hash. If the parameter starts with '!', then the negated value is to be returned.
#
# Here's how the method should work:
#
# a = CustomHash.new
# a[:some_key] = 'truthy value'
#
# a.get_bool('some_key') #=> true
# a.get_bool('!some_key') #=> false
#
# a.get_bool('key_that_doesnt_exist') #=> should raise an error if the key doesn't exist. Note: If the key does exist but the value is `nil`, this should return `false` -  (`nil` is a falsy value) not an error.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class CustomHash < Hash
  def get_bool(key)
    raise Error if !self.keys.include?(key.tr('!', '').to_sym)
    if key[0] == '!'
      self[key[1..-1].to_sym] ? false : true
    else
      self[key.to_sym] ? true : false
    end
  end
end
