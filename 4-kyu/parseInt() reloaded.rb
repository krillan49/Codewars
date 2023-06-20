#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata we want to convert a string into an integer. The strings simply represent the numbers in words.
#
# Examples:
#
# "one" => 1
# "twenty" => 20
# "two hundred forty-six" => 246
# "seven hundred eighty-three thousand nine hundred and nineteen" => 783919
# Additional Notes:
#
# The minimum number is "zero" (inclusively)
# The maximum number, which must be supported is 1 million (inclusively)
# The "and" in e.g. "one hundred and twenty-four" is optional, in some cases it's present and in others it's not
# All tested numbers are valid, you don't need to validate them

#===============================================================================================================
#                                               Solution
#===============================================================================================================

NUMS = {
  zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9,
  ten: 10, eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17, eighteen: 18, nineteen: 19,
  twenty: 20, thirty: 30, forty: 40, fifty: 50, sixty: 60, seventy: 70, eighty: 80, ninety: 90,
  hundred: 100, thousand: 1000, million: 1000000
}

def parse_unit(arr)
  sum = 0
  counter = 1_000_001
  arr.each do |e|
    if counter > NUMS[e]
      sum += NUMS[e]
      counter = NUMS[e]
    elsif counter < NUMS[e]
      sum *= NUMS[e]
      counter = NUMS[e]
    end
  end
  sum
end

def parse_int(string)
  arr = string.tr('-', ' ').split.delete_if{|e| e == 'and'}.map(&:to_sym)
  i = arr.index(:thousand) || 0
  i == 0 ? parse_unit(arr) : parse_unit(arr[0..i]) + parse_unit(arr[(i + 1)..-1])
end
