#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a function that takes a positive integer and returns the next smaller positive integer containing the same digits.
#
# For example:
#
# next_smaller(21) == 12
# next_smaller(531) == 513
# next_smaller(2071) == 2017
# Return -1 (for Haskell: return Nothing, for Rust: return None), when there is no smaller number that contains the same digits. Also return -1 when the next smaller number with the same digits would require the leading digit to be zero.
#
# next_smaller(9) == -1
# next_smaller(135) == -1
# next_smaller(1027) == -1  # 0721 is out since we don't write numbers with leading zeros
# some tests will include very large numbers.
# test data only employs positive integers.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def next_smaller n
  return -1 if n.to_s.chars.sort.join.to_i == n
  digits = n.to_s.reverse.chars.map.with_index{|d, i| [d, i]}
  e = digits.find.with_index{|a, i| i != 0 && a[0] > digits[i-1][0]}
  part1 = n.to_s[0..-e[1]-2] # n.to_s.reverse[e[1]+1..-1].reverse
  e_ = digits[0...e[1]].select{|d, i| d.to_i < e[0].to_i}.sort_by{|d, i| [-d.to_i, -i]}[0]
  part2 = digits[0..e[1]].map{|a| a[0]}
  part2[e[1]], part2[e_[1]] = part2[e_[1]], part2[e[1]]
  part2 = part2[-1] + part2[0..-2].sort.reverse.join
  res = (part1 + part2).to_i
  res.to_s.size < n.to_s.size ? -1 : res
end
