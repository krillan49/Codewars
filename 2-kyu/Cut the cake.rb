#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have a rectangular cake with some raisins on it:
#
# cake =
#   ........
#   ..o.....
#   ...o....
#   ........
# // o is the raisins
# We need to cut the cake evenly into n small rectangular pieces, so that each small cake has 1 raisin. n is not an argument, it is the number of raisins contained inside the cake:
#
# cake =
#   ........
#   ..o.....
#   ...o....
#   ........
#
# result should be an array:
#   [
#      ........
#      ..o.....
#   ,
#      ...o....
#      ........
#   ]
# // In order to clearly show, we omit the quotes and "\n"
# If there is no solution, return an empty array []
#
# Note
# The number of raisins is always more than 1 and less than 10.
# If there are multiple solutions, select the one with the largest width of the first element of the array. (See also the examples below.)
# Evenly cut into n pieces, meaning the same area. But their shapes can be different. (See also the examples below.)
# In the result array, the order of pieces is from top to bottom and from left to right (according to the location of the upper left corner).
# Each piece of cake should be rectangular.
# Examples
# An example of multiple solutions:
# cake =
#   .o......
#   ......o.
#   ....o...
#   ..o.....
#
# In this test case, we can found three solution:
# solution 1 (horizontal cutting):
#   [
#     .o......  //piece 1
#   ,
#     ......o.  //piece 2
#   ,
#     ....o...  //piece 3
#   ,
#     ..o.....  //piece 4
#   ]
#
# solution 2 (vertical cutting):
#   [
#     .o  //piece 1
#     ..
#     ..
#     ..
#   ,
#     ..  //piece 2
#     ..
#     ..
#     o.
#   ,
#     ..  //piece 3
#     ..
#     o.
#     ..
#   ,
#     ..  //piece 4
#     o.
#     ..
#     ..
#   ]
#
# solution 3 (cross cutting):
#   [
#     .o..  //piece 1
#     ....
#   ,
#     ....  //piece 2
#     ..o.
#   ,
#     ....  //piece 3
#     ..o.
#   ,
#     o...  //piece 4
#     ....
#   ]
#
# we need choose solution 1 as result
# An example of different shapes:
# cake =
#   .o.o....
#   ........
#   ....o...
#   ........
#   .....o..
#   ........
#
# the result should be:
#   [
#     .o      //pieces 1
#     ..
#     ..
#     ..
#     ..
#     ..
#   ,
#     .o....  //pieces 2
#     ......
#   ,
#     ..o...  //pieces 3
#     ......
#   ,
#     ...o..  //pieces 4
#     ......
#   ]
# Although they have different shapes,
# they have the same area(2 x 6 = 12 and 6 x 2 = 12).
# An example of no solution case:
# cake =
#   .o.o....
#   .o.o....
#   ........
#   ........
#   ........
#   ........
# the result should be []

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class CakeCutter
  def initialize(cake, area)
    @cake = cake.split("\n").map{|s| s.split('')}
    @y, @x = @cake.size-1, @cake[0].size-1
    @areas = all_possible_cuts_areas(area) #=> [[2, 8], [4, 4]]
    @cuts = []
  end

  def main
    cutter_recursion(@cake)
    @cuts.map{|cut| cut.map{|line| line.join}.join("\n")}
  end

  private

  def cutter_recursion(cake)
    size = @cuts.size
    res = nil
    @areas.each do |area|
      return cake if cake && cake.flatten.uniq == [' ']
      res = make_cut(area, cake)
      res = cutter_recursion(res) if res
      return res if res && res.flatten.uniq == [' ']
    end
    cake = res if @cuts.size > size
    @cuts.pop if @cuts.size == size
    cake
  end

  def make_cut(area, cake)
    cake = cake.clone.map{|a| a.clone}
    sp = start_point(cake)
    return false unless sp
    i, j = sp
    y, x = i + area[0] - 1, j + area[1] - 1
    cut = []
    (i..y).each do |n|
      line = []
      (j..x).each do |m|
        return false if !cake[n] || !cake[n][m] || cake[n][m] == ' '
        line << cake[n][m]
        cake[n][m] = ' '
      end
      cut << line
    end
    return false if cut.flatten.count('o') != 1
    @cuts << cut
    cake
  end

  def start_point(cake)
    (0..@y).each{|y| (0..@x).each{|x| return [y, x] if cake[y][x] != ' '}}
    false
  end

  def all_possible_cuts_areas(area)
    1.upto(area/2).map{|e| [e, area/e] if area % e == 0 && e <= @cake.size && area/e <= @cake[0].size}.compact
  end
end

def cut(cake)
  check = cake.gsub(/\s/, '')
  count = check.count('o')
  area = check.size / count
  return [] if check.size % count > 0
  CakeCutter.new(cake, area).main
end
