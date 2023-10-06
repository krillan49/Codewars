#===============================================================================================================
#                                               Description
#===============================================================================================================

# Some idle games use following notation to represent big numbers:
#
# Number	Notation	Description
# 1	1	1
# 1 000	1K	Thousand
# 1 000 000	1M	Million
# 1 000 000 000	1B	Billion
# 1 000 000 000 000	1T	Trillion
# 1 000 000 000 000 000	1aa	Quadrillion
# 10¹⁸	1ab	Quintillion
# 10²¹	1ac	Sextillion
# 10²⁴	1ad	Octillion
# And so on, from aa to az, then from ba to bz, etc, until zz. The letters before and including trillion should be uppercase, letters after quadrillion should be lowercase to easy distinguish between the 'common' notation and 'aa' one.
#
# Your task
# Your task is to write a function that accepts a floating point number and formats it using the notation given above.
#
# The resulting number should include 3 most significant digits and be rounded down towards zero (for example, 1238 should be 1.23K, and -1238 should be -1.23K). All trailing zeroes after the decimal point should be removed, and the decimal point should be excluded if the resulting number is whole number of units after the rounding down. If the number is too small and it's rounded down to 0, then 0 should be returned. Beware of the negative zero, which should not appear in the output, insted the regular zero 0 should be returned.
#
# Input limitation
# The input is a finite floating point number in range -10³⁰³ < x < 10³⁰³.
#
# Examples
#       0 => 0
#       1 => 1
#      -1 => -1
#     123 => 123
#    0.25 => 0.25
# -0.9999 => -0.99
#   0.009 => 0 (too small)
#    1000 => 1K
#    1234 => 1.23K
#   -4002 => -4K
#    5809 => 5.8K
# 100 000 => 100K
# 123 456 789 => 123M
# 1 234 567 890 => 1.23B
# 1 234 567 890 000 => 1.23T
# 999 999 999 999 999 => 999T
# 1 234 567 890 000 000 000 => 1.23ab
# -0.0000001 => 0
# 10³⁰⁰ => 1dr
# Alphabet for quick copypaste
# abcdefghijklmnopqrstuvwxyz

#===============================================================================================================
#                                               Solution
#===============================================================================================================

AA = [''] + %w[K M B T] + ('aa'..'zz').to_a

def format_float(x)
  int_size = x.to_s.split('.')[0].size
  res = int_size == 3 ? x.floor : int_size == 2 ? x.floor(1) : x
  res == res.floor ? res.floor : res
end

def format_number(x)
  return '0' if (x >= 0 && x < 0.01) || (x <= 0 && x > -0.01)
  sign = x > 0 ? '' : '-'
  x = x.abs
  zeros = (x.floor.to_s.size - 1) / 3 * 3
  "#{sign}#{format_float((x / ('1' + '0' * zeros).to_f).floor(2))}#{AA[zeros / 3]}"
end
