#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a class called Code that allows to store arbitrary "named code" as in the example below:
#
# Code.green = '00FF00'
# Code.red = 0xFF0000
#
# Code.green # => known code, return exactly as spcified: '00FF00'
# Code.red   # => known code, return exactly as spcified: 0xFF0000
# Code.blue  # => unknown code, raise exception
# Basically, it starts from a blank slate. If you try to call any method on it, it raises an exception.
#
# Then, whenever somebody specifies a new code by calling Code.<name-of-the-code> = <something>, it remembers that, and the next time somebody calls the <name-of-the-code> method, it returns the stored value (<something>). Note that this value can be anything - a string, a number, any object, including nil.
#
# If a method is called for an unknown code, an exception should still be raised.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Code
  METHODS = {}

  def self.method_missing(method, arg = nil)
    return store_attribute(method, arg) if method.to_s.end_with?('=')
    if !METHODS.keys.include?(method)
      raise
    end
    METHODS[method]
  end

  private

  def self.store_attribute(method, arg)
    k = method.to_s.delete_suffix('=').to_sym
    METHODS[k] = arg
  end
end
