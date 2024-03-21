#===============================================================================================================
#                                               Description
#===============================================================================================================

# Define a class Conjurer with a class method conjure that takes two mandatory parameters: name and lambda.
#
# When called, it should define a new instance method in the Conjurer class with the method name equal to the name parameter, and with the method body equal to the lambda.
#
# Conjurer.conjure(:one_through_five, ->{(1..5).to_a})
# Conjurer.new.one_through_five
# # => [1, 2, 3, 4, 5]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Conjurer
  def Conjurer.conjure(n, l)
    send :define_method, n do
      l.call
    end
  end
end
