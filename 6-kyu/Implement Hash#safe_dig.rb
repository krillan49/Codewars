#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a hash and a list of n keys, return the value of the nth nested value.
#
# If there are more keys than there are nested levels of hashes, the method should return nil rather than raise an exception.
#
# All keys are assumed to be symbols in this kata.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Hash
  def safe_dig(*keys)
    self.dig(*keys) rescue nil
  end
end
