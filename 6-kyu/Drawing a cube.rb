#===============================================================================================================
#                                               Description
#===============================================================================================================

# Draw a cube using ASCII chars. You will be given n (integer) as cube size (width and height). For n <= 0 return empty string.
#
# Requirements:
# - Cube should be countured with `#`,
# - Front cube's face should have ` ` character,
# - Other faces should have `*` character
# - Cube should end with newline character `\n`
# - Return `string`
# Examples:
# n=1
# #\n
#
# n=2
#  ##\n
# ###\n
# ##\n
#
# n=3
#   ###\n
#  #*##\n
# ###*#\n
# # ##\n
# ###\n
#
# n=4
#    ####\n
#   #**##\n
#  #**#*#\n
# ####**#\n
# #  #*#\n
# #  ##\n
# ####\n
#
# n=5
#     #####\n
#    #***##\n
#   #***#*#\n
#  #***#**#\n
# #####***#\n
# #   #**#\n
# #   #*#\n
# #   ##\n
# #####\n

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def draw_cube n
  return ['', "#\n", " ##\n###\n##\n"][n] if n < 3
  u_mid = (1..n-2).map.with_index{|_,i| '#' + '*'*(n-2) + '#' + '*'*i + '#'}.map{|x| ' '*(2*n - 1 - x.size) + x}
  d_mid = (1..n-2).map.with_index{|_,i| '#' + ' '*(n-2) + '#' + '*'*(n-3-i) + '#'}
  ([' '*(n-1) + '#'*n] + u_mid + ['#'*n + '*'*(n-2) + '#'] + d_mid + ['#'*n]).join("\n") + "\n"
end
