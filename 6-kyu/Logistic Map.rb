#===============================================================================================================
#                                               Description
#===============================================================================================================

# Our AAA company is in need of some software to help with logistics: you will be given the width and height of a map, a list of x coordinates and a list of y coordinates of the supply points, starting to count from the top left corner of the map as 0.
#
# Your goal is to return a two dimensional array/list with every item having the value of the distance of the square itself from the closest supply point expressed as a simple integer.
#
# Quick examples:
#
# logistic_map(3,3,[0],[0])
# #returns
# #[[0,1,2],
# # [1,2,3],
# # [2,3,4]]
# logistic_map(5,2,[0,4],[0,0])
# #returns
# #[[0,1,2,1,0],
# # [1,2,3,2,1]]
# Remember that our company is operating with trucks, not drones, so you can simply use Manhattan distance. If supply points are present, they are going to be within the boundaries of the map; if no supply point is present on the map, just return None/nil/null in every cell.
#
# logistic_map(2,2,[],[])
# #returns
# #[[None,None],
# # [None,None]]
# Note: this one is taken (and a bit complicated) from a problem a real world AAA company [whose name I won't tell here] used in their interview. It was done by a friend of mine. It is nothing that difficult and I assume it is their own version of the FizzBuzz problem, but consider candidates were given about 30 mins to solve it.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def logistic_map(width, height, xs, ys)
  arr = Array.new(height){ Array.new(width, nil) }
  return arr if [xs, ys].any?(&:empty?)
  points = ys.zip(xs)
  arr.map.with_index do |a, i|
    a.map.with_index do |e, j|
      points.map{|y, x| (y - i).abs + (x - j).abs}.min
    end
  end
end
