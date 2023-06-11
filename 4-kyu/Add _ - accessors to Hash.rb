#===============================================================================================================
#                                               Description
#===============================================================================================================

# Instead of having to access values in hash by
#
# h[:one]
# or
#
# h["one"]
# write a method_missing that allows to use
#
# h._one
# both for reading and writing. It should
#
# first check for a key as a symbol, then for a key as a string
# return nil if neither was found
# return the value upon setting a new one
# add a new key as a symbol if it doesn't exist yet
# update whatever key is there, either symbol or string

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Hash
  def method_missing(symbol, *args)
    symbol = symbol[1..-1] if symbol[0] == '_'
    return store_attribute(symbol, *args) if symbol.end_with?('=')
    self.key?(symbol.to_sym) ? self[symbol.to_sym] : self[symbol]
  end

  private

  def store_attribute(method, *args)
    k = method.delete_suffix('=').to_sym
    self.key?(k.to_s) && !self.key?(k) ? self[k.to_s] = args[0] : self[k] = args[0]
  end
end
