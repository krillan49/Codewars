#===============================================================================================================
#                                               Description
#===============================================================================================================

# Upgrade Ruby's Hash class to work like a JavaScript Object. For example:
#
# hash = {:five => 5, :ten => 10}
# hash.five  #=> 5
#
# hash.fifteen = 15
# hash[:fifteen]  #=> 15
# This should work for any Ruby hash, both setting and getting values. For simplicity's sake, don't worry about supporting string keys, only symbols.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Hash
  def method_missing(method, *args)
    return store_attribute(method, *args) if method.to_s[-1] == '='
    self[method]
  end

  private

  def store_attribute(method, *args)
    k = method.to_s[0..-2].to_sym
    self[k] = args[0]
  end
end
