#===============================================================================================================
#                                               Description
#===============================================================================================================

# We are given a sequence of coplanar points and see all the possible triangles that may be generated which all combinations of three points.
#
# We have the following list of points with the cartesian coordinates of each one:
#
# Points [x, y]
#    A   [1, 2]
#    B   [3, 3]
#    C   [4, 1]
#    D   [1, 1]
#    E   [4, -1]
# With these points we may have the following triangles: ABC, ABD, ABE, ACD, ACE, ADE, BCD, BCE, BDE, CDE. There are three special ones: ABC, ACD and CDE, that have an angle of 90°. All is shown in the picture below:
#
# https://imgur.com/Kq0dAU1
#
# We need to count all the rectangle triangles that may be formed by a given list of points. Note that possible duplicate points should be counted only once to form a triangle.
#
# The case decribed above will be:
#
# count_rect_triang([[1, 2],[3, 3],[4, 1],[1, 1],[4, -1]]) == 3
# Observe this case:
#
# count_rect_triang([[1, 2],[4, -1],[3, 3],[4, -1],[4, 1],[1, 1],[4, -1], [4, -1], [3, 3], [1, 2]]) == 3
# If no rectangle triangles may be generated the function will output 0.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def count_rect_triang(points)
  points.uniq.combination(3).select{|a, b, c|
    t = [(a[0]-b[0])**2+(a[1]-b[1])**2, (a[0]-c[0])**2+(a[1]-c[1])**2, (c[0]-b[0])**2+(c[1]-b[1])**2].sort
    t[-1] == t[0..1].sum
  }.size
end
