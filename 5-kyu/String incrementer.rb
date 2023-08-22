#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your job is to write a function which increments a string, to create a new string.
#
# If the string already ends with a number, the number should be incremented by 1.
# If the string does not end with a number. the number 1 should be appended to the new string.
# Examples:
#
# foo -> foo1
#
# foobar23 -> foobar24
#
# foo0042 -> foo0043
#
# foo9 -> foo10
#
# foo099 -> foo100
#
# Attention: If the number has leading zeros the amount of digits should be considered.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def increment_string(input)
  i = input.chars.index.with_index{|c, j| input[j..-1].chars.all?{|e| (48..57).include?(e.ord)} } || input.size
  return input + '1' if input[i..-1].size == 0
  first, last = input[0...i], input[i..-1]
  lip1 = (last.to_i + 1).to_s
  lip1.size >= last.size ? first + lip1 : first + '0'*(last.size - lip1.size) + lip1
end
