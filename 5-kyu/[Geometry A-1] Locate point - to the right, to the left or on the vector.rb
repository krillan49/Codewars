#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your task is to determine the relationship between the given point and the vector. Direction of the vector is important! To determine if the point is to the left or to the right, you should imagine yourself standing at the beginning of the vector and looking at the end of the vector.
#
# Arguments
# You are given coordinates of a point and coordinates of a vector on 2D plane:
#
# point = [x, y]
#
# vector = [[x, y], [x, y]] (two points, direction is from first to second)
#
# Vectors always have non-zero length, so you don't have to check for that at this point.
#
# Return
# Your function must return:
#
# -1 if the point is to the left of the vector,
#
# 0 if the point is on the same line as vector,
#
# 1 if the point is to the right of the vector.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def point_vs_vector(p, v)
  0 <=> (v[1][0] - v[0][0]) * (p[1] - v[1][1]) - (v[1][1] - v[0][1]) * (p[0] - v[1][0])
end
