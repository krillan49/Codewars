#===============================================================================================================
#                                               Description
#===============================================================================================================

# Ruby has very powerful enumerator support, including the ability to create your own custom enumerators on the fly.
#
# digits = Enumerator.new do |y|
#   i = 0
#   loop do
#     y.yield i
#     i += 1
#   end
# end
#
# digits.next # => 0
# digits.next # => 1
#
# digits.take_while {|n| n < 13} # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
# Create an enumerator "fib" that outputs successive fibonacci numbers.
#
# For example:
#
# fib.next # => 1
# fib.next # => 1
# fib.next # => 2
#
# fib.take_while {|n| n < 100} # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
# ** NOTE: The first value returned from the enumerator will be 1, not 0**

#===============================================================================================================
#                                               Solution
#===============================================================================================================

fib = Enumerator.new do |y|
  a, b = 0, 1
  loop do
    y.yield b
    a, b = b, a+b
  end
end
