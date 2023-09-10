#===============================================================================================================
#                                               Description
#===============================================================================================================

# Part of meta-programming is creating classes dynamically.
#
# In this task you need to make module Foo, such that if you call any inner class of Foo that doesn't exist, Foo will create the inner class and return a friendly greeting to the new class.
#
# Example:
#
# > Foo::Bar
# => "Hello, Bar!"
#
# > Foo::Lemon
# => "Hello, Lemon!"
# Hint: Classes in ruby are actually just constants. Ruby already comes with methods to check if there is a missing constant, and how to create a new constant.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

module Foo
  def self.const_missing(name)
    "Hello, #{name}!"
  end
end
