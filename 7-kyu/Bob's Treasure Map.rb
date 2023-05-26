#===============================================================================================================
#                                               Description
#===============================================================================================================

# Intro
# Bob found a map with directions to lead him to a magnificient treasure, but he is kind of dumb and need your help to find the treasure!
#
# Actual usefull information
# Your task is to return the coordinate of the treasure so Bob can easily find it, or, if the map is fake, return nil since there is no treasure to be found.
#
# Directions are given by the means of a string like this: "WWSSNNEE" where:
#
# N = North (Up)
# S = South (Down)
# E = East (Right)
# W = West (Left)
# Anything else that could be in the String is just there to confuse Bob.
# If a map is not a String or is one with no valid direction, it means it's fake.
#
# The coordinates must be return in an array like so: [x,y]
#
# Examples
# "NNNNN" => [0,5]  # Up 5 times.
# "SSNSE" => [1,-2] # Down 2 times, up 1 time, then down once again and finish with 1 right.
# "WBWWX" => [-3,0] # You aren't Bob so, don't get confused.
# "AAAAA" => nil    # The map has no valid direction, so it's fake.
# 1234567 => nil    # The map is not a String, so it's fake.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def treasure_finder(map)
  return nil if map.class != String or map.gsub(/[^NSEW]/, '') == ''
  x, y = 0, 0
  map.chars.each do |direction|
    case direction
    when 'N'; y += 1
    when 'S'; y -= 1
    when 'E'; x += 1
    when 'W'; x -= 1
    end
  end
  [x, y]
end
