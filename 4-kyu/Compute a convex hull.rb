#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Problem
# Consider a flat board with pegs sticking out of one side. If you stretched a rubber band across the outermost pegs what is the set of pegs such that all other pegs are contained within the shape formed by the rubber band?
#
# alt text
#
# More specifically, for this kata you will be given a list of points represented as [x,y] co-ordinates. Your aim will be to return a sublist containing points that form the perimeter of a polygon that encloses all other points contained within the original list.
#
# Notes:
# The tests may include duplicate and/or co-linear points. Co-linear points are a set of points which fall on the same straight line. Neither should be included in your returned sublist
#
# For simplicity, there will always be at least 3 points
#
# Help:
# Check out wikipedia's page on convex hulls

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def clockwise?(x1, y1, x2, y2, x3, y3) # calculate twice the sign area of a triangle
  (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1) < 0 # does the specified triple of points form a clockwise rotation
end

def point_reject(sn, pA, pB, n)
  res = if n == 'up' # sn sort by abscissa, start points (pA, pB) sort vice versa
    [pA, pB].sort_by{|x, y| [-x, -y]} + sn.sort_by{|x, y| [x, y]}
  else # vice versa
    [pA, pB].sort_by{|x, y| [x, y]} + sn.sort_by{|x, y| [-x, -y]}
  end
  (res.size * 3).times do
    clockwise?(res[0][0], res[0][1], res[1][0], res[1][1], res[2][0], res[2][1]) ? res.rotate! : res.delete_at(1)
  end
  res
end

def hull_method(points)
  points = points.uniq.sort
  pA, pB = points.min_by{|x, y| [x, y]}, points.max_by{|x, y| [x, y]}
  a, b, c = pB[1] - pA[1], pA[0] - pB[0], pA[1] * pB[0] - pA[0] * pB[1] # coefficients of the straight line equation ax + by + c = 0

  ups, downs, = [], [] # arrays for points to the upper and lower half-plane relative to the straight line
  points.each do |x, y|
    downs << [x, y] if a * x + b * y + c > 0 #  ax+by+c>0 -  in the lower half-plane with respect to the straight line
    ups << [x, y] if a * x + b * y + c < 0 #  ax+by+c<0 -  in the upper half-plane with respect to the straight line
  end

  (point_reject(ups, pA, pB, 'up') + point_reject(downs, pA, pB, 'down')).uniq
end
