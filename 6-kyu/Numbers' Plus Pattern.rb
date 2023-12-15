#===============================================================================================================
#                                               Description
#===============================================================================================================

# #Task# Raj once wanted to code a program to make a plus sign using the numbers but he didn't have any idea to do so. Using n as a parameter in the function pattern complete the code and solve the pattern so that Raj fells happy.
#
# ###Rules/Note:###
#
# You are assured that n>1
# There are white spaces on top and bottom left corner (take help of test cases)
# #Examples#
#
# pattern(2)
#
#  1
# 121
#  1
# pattern(5)
#
#     1
#     2
#     3
#     4
# 123454321
#     4
#     3
#     2
#     1
#
#
# pattern(12)
#
#              1
#              2
#              3
#              4
#              5
#              6
#              7
#              8
#              9
#              0
#              1
#   12345678901210987654321
#              1
#              0
#              9
#              8
#              7
#              6
#              5
#              4
#              3
#              2
#              1

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def pattern(n)
  l = Array.new(n-1){ (' ' * (n-1) + 'n').chars }.map.with_index(1){|a, i| a.map{|e| e == 'n' ? i % 10 : e}.join}
  m = [(1..n-1).map{|e| e % 10}.join + (n % 10).to_s + (1..n-1).map{|e| e % 10}.reverse.join]
  (l + m + l.reverse).join("\n") + "\n"
end
