#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a function that takes a positive integer and returns the next bigger number that can be formed by rearranging its digits. For example:
#
#   12 ==> 21
#  513 ==> 531
# 2017 ==> 2071
# If the digits can't be rearranged to form a bigger number, return -1 (or nil in Swift, None in Rust):
#
#   9 ==> -1
# 111 ==> -1
# 531 ==> -1

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def next_bigger(n)
  return -1 if n.to_s.chars.sort.reverse.join.to_i == n
  digits = n.to_s.reverse.chars.map.with_index{|d, i| [d, i]}
  e = digits.find.with_index{|a, i| i != 0 && a[0] < digits[i-1][0]}
  part1 = n.to_s[0..-e[1]-2] # n.to_s.reverse[e[1]+1..-1].reverse
  e_ = digits[0...e[1]].select{|d, i| d.to_i > e[0].to_i}.sort_by{|d, i| [d.to_i, -i]}[0]
  part2 = digits[0..e[1]].map{|a| a[0]}
  part2[e[1]], part2[e_[1]] = part2[e_[1]], part2[e[1]]
  part2 = part2[-1] + part2[0..-2].sort.join
  (part1 + part2).to_i
end
