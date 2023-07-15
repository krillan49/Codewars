#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this Kata, you will be given a mathematical string and your task will be to remove all braces as follows:
#
# solve("x-(y+z)") = "x-y-z"
# solve("x-(y-z)") = "x-y+z"
# solve("u-(v-w-(x+y))-z") = "u-v+w+x+y-z"
# solve("x-(-y-z)") = "x+y+z"
# There are no spaces in the expression. Only two operators are given: "+" or "-".

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve(str)
  while str.include?('(') or str.include?(')')
    str = str.chars.slice_when{|a, b| a == ')' or b == '('}.map{|a| (a[0] == '(' && a[-1] == ')') ? a[1..-2].join : a }.flatten
    str = str.map.with_index do |e, i|
      i > 0 && e.size > 1 && str[i-1] == '-' ? (e[0] == '-' || e[0] == '+' ? e[0] + e[1..-1].tr('+-','-+') : e.tr('+-','-+')) : e
    end.join.gsub(/\+\-|\-\+/, '-').gsub(/\-\-/, '+')
    str = str[1..-1] if str[0] == '+'
  end
  str
end
