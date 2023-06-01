#===============================================================================================================
#                                               Description
#===============================================================================================================

# For a new 3D game that will be released, a team of programmers needs an easy function. (Then it will be processed as a method in a Class, forget this concept for Ruby)
#
# We have an sphere with center O, having in the space the coordinates [α, β, γ] and radius r and a list of points, points_list, each one with coordinates [x, y, z]. Select the biggest triangle (or triangles) that has (have) all its (their) 3 vertice(s) as interior points of the sphere (not even in the sphere contour). You should consider that a point P is interior if its distance to center O, d, is such that:
#
#
# d < r
# and
# |(d - r) / r| > 10-10
# Let's see the situation with the following points in the image posted below:
#
# A = [1,2,-4]; B = [-3, 2, 4]; C = [7, 8, -4]; D = [2, 3, 5]; E = [-2, -1, 1]
# The sphere has the following features:
#
# O = [1, 2, -2] (Center of the sphere)
# radius = 8
# source: imgur.com
#
# As C is the only exterior point of the sphere, the possible triangles that have their vertices interior to the sphere are:
#
# ABD, ABE, ADE, BDE
# Let's see which is the biggest one:
#
# Triangle    Triangle with its points         Area
# ABD        [[1,2,-4],[-3,2,4],[2,3,5]]    22.44994432064
# ABE        [[1,2,-4],[-3,2,4],[-2,-1,1]]  13.56465996625
# ADE        [[1,2,-4],[2,3,5],[-2,-1,1]]   22.62741699796 <---- biggest triangle
# BDE        [[-3,2,4],[2,3,5],[-2,-1,1]]   11.31370849898
# Our function biggest_triang_int() should output for this case:
#
# points_list = [[1,2,-4], [-3, 2, 4], [7, 8, -4], [2, 3, 5], [-2, -1, 1]]
# center = [1, 2, -2]
# radius = 8
# biggest_triang_int(points_list, center, radius) == [4, 22.62741699796,  [[1,2,-4],[2,3,5],[-2,-1,1]]]
# That means that with the given points list we may generate 4 triangles with all their vertices as interior points of the sphere, the biggest triangle has an area of 22.62741699796 (the units does not matter and the values for the area should not be rounded) and finally, there is only one triangle with this maximum value. Every triangle should be output having the same order of its vertices than in the given list of points. B = [-3,2,4], comes before than D =[2,3,5] and the last one E = [-2,-1,1] If in the result we have only one triangle, the function should output a list of three points.
#
# Let'see the next case:
#
# points_list = [[1,2,-4], [-3, 2, 4], [7, 8, -4], [2, 3, 5], [-2, -1, 1],
#               [3, 2, 6], [1, 4, 0], [-4, -5, -6], [4, 5, 6], [-2, -3, -5],
#               [-1, -2, 4], [-3, -2, -6], [-1, -4, 0], [2, 1, -1]]
# sphere_center = [0, 0, 0]
# radius = 8
# biggest_triang_int(points_list, sphere_center, radius) == [165, 33.645207682521445, [[[1, 2, -4], [3, 2, 6], [-1, -4, 0]], [[1, 4, 0], [-1, -2, 4], [-3, -2, -6]]]]
# Now there are a total of 165 triangles with their vertices in the sphere, the biggest triangle has an area of 33.645207682521445 but we have two triangles with this area value. The vertices of each triangle respect the order of the points list as we expressed before but the additional detail is that the triangles are sorted by the values of the coordinates of their points. Let's compare the coordinates of the first point
#
# First point   x  y  z
# Triangle1     1  2 -4  <--- this triangle is first in the result
# Triangle2     1  4  0
#               |  |
#               |  y1 < y2 (2, 4)
#               |
#               x1 = x2     (1 = 1)
# In the case that all the given points are exterior to the sphere the function should output the empty list.
#
# The points in the list are all valid and each one occurs once.
#
# Remember that if three points are collinear do not form a triangle. For practical purposes you may consider that if the area of a triangle is lower than 10-8, the points are aligned.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def biggest_triang_int(points, center, radius)
  points_in_sphere = points.select do |x, y, z|
    d = ((x-center[0])**2 + (y - center[1])**2 + (z - center[2])**2)**0.5
    d < radius && ((d - radius).to_f / radius).abs > 10**(-10)
  end

  return [] if points_in_sphere.size < 3

  tiangles = points_in_sphere.combination(3).map do |(x1,y1,z1),(x2,y2,z2),(x3,y3,z3)|
    a = [x2-x1, y2-y1, z2-z1]#ab
    b = [x3-x1, y3-y1, z3-z1]#ac
    i = a[1] * b[2] - b[1] * a[2]
    j = b[0] * a[2] - a[0] * b[2]
    k = a[0] * b[1] - b[0] * a[1]
    s = 0.5 * (i**2 + j**2 + k**2)**0.5
    [s, [[x1,y1,z1],[x2,y2,z2],[x3,y3,z3]]]
  end
  .reject{|s, p| s < 10**(-8)}

  max_square = tiangles.max_by{|s, p| s}[0]
  trimax = tiangles.select{|s, p| s == max_square}.map{|s, p| p}
  trimax = trimax.flatten(1) if trimax.size == 1

  [tiangles.size, max_square, trimax]
end
