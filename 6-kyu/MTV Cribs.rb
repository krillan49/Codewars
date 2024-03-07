#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given n representing the number of floors build a beautiful multi-million dollar mansions like the ones in the example below:
#
#      /\
#     /  \
#    /    \
#   /______\  number of floors 3
#   |      |
#   |      |
#   |______|
#
#      /\
#     /  \
#    /____\
#    |    |   2 floors
#    |____|
#
#      /\
#     /__\    1 floor
#     |__|
# Note: whitespace should be preserved on both sides of the roof. Number of floors will go up to 30. There will be no tests with invalid input.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def my_crib(n)
  r = Array.new(n){Array.new(n*2+2, ' ')}.map.with_index(1) do |a, i|
    a.map.with_index{|c, j| j == i ? '/' : j == a.size-1-i ? '\\' : c}
  end
  m = ['/' + '_' * (n * 2) + "\\"]
  h = ['|' + ' ' * (n * 2) + '|'] * (n - 1)
  f = ['|' + '_' * (n * 2) + '|']
  (r.reverse.map(&:join) + m + h + f).join("\n")
end
