#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given an array arr of strings, complete the function by calculating the total perimeter of all the islands. Each piece of land will be marked with 'X' while the water fields are represented as 'O'. Consider each tile being a perfect 1 x 1 piece of land. Some examples for better visualization:
#
# ['XOOXO',
#  'XOOXO',
#  'OOOXO',
#  'XXOXO',
#  'OXOOO']
# which represents:
#
# https://i.snipboard.io/ZOQYs2.jpg
#
# should return: "Total land perimeter: 24".
#
# Following input:
#
# ['XOOO',
#  'XOXO',
#  'XOXO',
#  'OOXX',
#  'OOOO']
# which represents:
#
# https://i.snipboard.io/Kv9BEz.jpg
#
# should return: "Total land perimeter: 18"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def land_perimeter(land)
  m = land.map(&:chars)
  p = 0
  m.each_with_index do |a, i|
    a.each_with_index do |e, j|
      if e == 'X'
        p += 1 if i == 0 or m[i-1][j] != e
        p += 1 if i == m.size-1 or m[i+1][j] != e
        p += 1 if j == 0 or m[i][j-1] != e
        p += 1 if j == a.size-1 or m[i][j+1] != e
      end
    end
  end
  "Total land perimeter: #{p}"
end
