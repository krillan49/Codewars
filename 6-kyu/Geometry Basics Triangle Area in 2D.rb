#===============================================================================================================
#                                               Description
#===============================================================================================================

# This series of katas will introduce you to basics of doing geometry with computers.
#
# Point objects have x, y attributes. Triangle objects have attributes a, b, c describing their corners, each of them is a Point.
#
# Write a function calculating area of a Triangle defined this way.
#
# Tests round answers to 6 decimal places.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def triangle_area(t)
  0.5 * ((t.b.x - t.a.x) * (t.c.y - t.a.y) - (t.c.x - t.a.x) * (t.b.y - t.a.y)).abs
end
