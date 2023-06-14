#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a simple method for the Hash-class that can get the configuration-value from a JSON-interpreted hash. Its signature is:
#
# Hash.get_value( default, key1, ... )
# key1, ... refer to the hash-keys of the JSON-interpreted hash, which is a hash of hash values. If the path of keys is found, it should return the found value, else it should return the default value.
#
# Here are some examples on how to use it:
#
# config = { :files => { :mode => 0x777 }, :name => "config" }
#
# config.get_value( 0x0, :files, :mode ) == 0x777
# config.get_value( "", :name ) == "config"
# config.get_value( 80, :port ) == 80
# config.get_value( "cfg", :files, :extension ) == "cfg"

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# the test button does not work in this kata press attempt

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Hash
  def get_value(default, *args)
    return default if args == []
    res = nil
    args.each do |key|
      res = (res ? (res[key] rescue default) : self[key])
      return default if !res
    end
    res
  end
end
