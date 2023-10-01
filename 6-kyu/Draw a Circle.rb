#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata, you will create a function, circle, that produces a string of some radius, according to certain rules that will be explained shortly. Here is the output of circle when passed the integer 10:
#
#      █████████
#     ███████████
#   ███████████████
#   ███████████████
#  █████████████████
# ███████████████████
# ███████████████████
# ███████████████████
# ███████████████████
# ███████████████████
# ███████████████████
# ███████████████████
# ███████████████████
# ███████████████████
#  █████████████████
#   ███████████████
#   ███████████████
#     ███████████
#      █████████
# (Note: For Python and Ruby users, this will use '#', rather than '█')
#
# The circle consists of spaces, and the character \u2588. Note that this is a complete square of characters, so the 'gaps' are filled with spaces. For instance, the last line of the above ends with the five characters "\u2588     "; there are five spaces at the end.
#
# All characters whose distance from the center is less than the given radius is defined as 'in the circle', hence the character at that position should be filled with \u2588 rather than spaces. So, for instance, this is a circle of radius 2:
#
# ███
# ███
# ███
# Whilst this isn't very circle-y, this is what the rules expect.
#
# Here are the edge-case rules; there are examples in the example test cases:
#
# A negative radius should result in an empty string.
# A radius of 0 should produce the string "\n:.
# Any other result should end with \n.
# Please note that the distance metric is Euclidean distance (the most common notion of distance) centered around the middle of a character, where each character is of width and height exactly one.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def circle(r)
  return '' if r < 0
  return "\n" if r == 0
  arr = Array.new(2*r-1){Array.new(2*r-1, ' ')}
  cy = cx = arr.size / 2
  arr.map.with_index do |a, i|
    a.map.with_index do |e, j|
      (((cy - i)**2 + (cx - j)**2)**0.5).floor < r ? '#' : e
    end.join
  end.join("\n")+"\n"
end
