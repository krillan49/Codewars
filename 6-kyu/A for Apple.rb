#===============================================================================================================
#                                               Description
#===============================================================================================================

# Input: Integer n
# Output: String
# Example:
#
# a(4) prints as
#
#    A
#   A A
#  A A A
# A     A
# a(8) prints as
#
#        A
#       A A
#      A   A
#     A     A
#    A A A A A
#   A         A
#  A           A
# A             A
# a(12) prints as
#
#            A
#           A A
#          A   A
#         A     A
#        A       A
#       A         A
#      A A A A A A A
#     A             A
#    A               A
#   A                 A
#  A                   A
# A                     A
# Note:
#
# Each line's length is 2n - 1
# Each line should be concatenate by line break "\n"
# If n is less than 4, it should return ""
# If n is odd, a(n) = a(n - 1), eg a(5) == a(4); a(9) == a(8)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def a(n)
  return '' if n < 4
  n -= 1 if n.odd?
  arr = Array.new(n){Array.new(2 * n - 1, ' ')}
  arr.map.with_index do |a, i|
    if i == arr.size / 2 && (arr.size / 2).even?
      a.map.with_index{|e, j| (j >= a.size / 2 - i && j <= a.size / 2 + i && j.odd?) ? 'A' : e}.join
    elsif i == arr.size / 2 && (arr.size / 2).odd?
      a.map.with_index{|e, j| (j >= a.size / 2 - i && j <= a.size / 2 + i && j.even?) ? 'A' : e}.join
    else
      a.map.with_index{|e, j| (j == a.size / 2-i || j == a.size / 2 + i) ? 'A' : e}.join
    end
  end.join("\n")
end
