#===============================================================================================================
#                                               Description
#===============================================================================================================

# A circle is defined by three coplanar points that are not aligned.
#
# You will be given a list of circles and a point [xP, yP]. You have to create a function, count_circles() (Javascript countCircles()), that will count the amount of circles that contains the point P inside (the circle border line is included).
#
# list_of_circles = ([[[-3,2], [1,1], [6,4]], [[-3,2], [1,1], [2,6]], [[1,1], [2,6], [6,4]], [[[-3,2],[2,6], [6,4]]]
#
# point1 = [1, 4] # P1
# count_circles(list_of_circles, point1) == 4 #(The four circles have P1 inside)
# It may happen that the point may be external to all the circles.
#
# list_of_circles = ([[[-3,2], [1,1], [6,4]], [[-3,2], [1,1], [2,6]], [[1,1], [2,6], [6,4]], [[-3,2],[2,6], [6,4]]]
#
# point2 = [10, 6] # P2
# count_circles(list_of_circles, point2) == 0 #(P2 is exterior to the four circles)
# The point may be in the circle line and that will be consider as an internal point of it, too. For practical purposes a given point P will be in the circle line if:
#
# |r - d|/r < 10-10
#
# r: radius of the circle that should be calculated from the coordinates of the three given points.
#
# d: distance from the point P to the center of the circle. Again we have to do a calculation, the coordinates of the center should be calculated using the coordinates of the three given points.
#
# Let's see a case when the pints is in the circle line.
#
# list_of_circles = ([[[-3,2], [1,1], [6,4]], [[-3,2], [1,1], [2,6]], [[1,1], [2,6], [6,4]], [[[-3,2],[2,6], [6,4]]]
#
# point3 = point2 = [2, 6] # P3
# count_circles(list_of_circles, point3) == 4 #(P3  is an internal point of the four circles)
# All these three cases are shown in the image below:
#
# source: imgur.com
#
# Your code should be able to skip these cases:
#
# inexistent circle when we have three points aligned
#
# undefined circles when two or three of given points coincides.
#
# First ten people to solve it will receive extra points.
#
# Hints: This kata will give you important formulas: Give The Center And The Radius of Circumscribed Circle. (A warm up challenge) http://www.codewars.com/kata/give-the-center-and-the-radius-of-circumscribed-circle-a-warm-up-challenge
#
# Features of the tests:
#
# N: amount of Tests
#
# n: amount of given circles x, y: coordinates of the points that define the circle xP, yP: coordinates of the point P
#
# N = 500
#
# 10 < n < 500
#
# -500 < x < 500, -500 < y < 500
#
# -750 < xP < -750, -750 < yP < -750

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def count_circles(list_of_circles, point)
  res = 0
  list_of_circles.each do |cir|
    a = cir[1][0] - cir[0][0]
    b = cir[1][1] - cir[0][1]
    c = cir[2][0] - cir[0][0]
    d = cir[2][1] - cir[0][1]
    e = a * (cir[0][0] + cir[1][0]) + b * (cir[0][1] + cir[1][1])
    f = c * (cir[0][0] + cir[2][0]) + d * (cir[0][1] + cir[2][1])
    g = 2 * (a * (cir[2][1] - cir[1][1]) - b * (cir[2][0] - cir[1][0]))
    if g != 0
      cx = (d * e - b * f) / g.to_f
      cy = (a * f - c * e) / g.to_f
      r = ((cx - cir[0][0])**2 + (cy - cir[0][1])**2)**0.5
      l = ((cx - point[0])**2 + (cy - point[1])**2)**0.5
      res += 1 if r.round(10) >= l.round(10)
    end
  end
  res
end
