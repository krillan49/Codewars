#===============================================================================================================
#                                               Description
#===============================================================================================================

# Bocce is a game played by two competing teams, with three types of balls. Each team has its own set of balls (in this kata red and black) and there is a neutral ball called the jack. The jack is thrown at the beginning of each round, followed by the players trying to throw their balls as closely to it as possible. The team with their balls closest to the jack wins the round!
#
# The number of points the winning team scores equals the number of their balls being closer to jack than any of the other team's balls: if the red team has 3 balls closer to jack than any of the black team's balls, they will win scoring 3 points. Equidistant balls on opposing teams will cancel out and neither team will score beyond that point.
#
# For more information on Bocce see here.
#
# Your task
# Implement a function that will return a message indicating the winner of the round. If there's no winner, return the string "No points scored".
#
# It takes an array of balls that are hash tables (depending on your language). Each ball has 2 properties: type and distance.
#
# The type will be "red", "black", or "jack". For all test cases, the jack will be the last element on the balls array. The distance property will be an array with two integer values. The first value is the distance thrown forward, the second value is the distance thrown left or right (negative values indicate distance to the left). For the purposes of this Kata, all balls are thrown from the same initial point.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bocce_score_helper(balls, color, v)
  balls.select{|hh| hh[:type] == color}.map{|hh| hh[:distance]}.map{|d| Math.sqrt((d[0] - v[0])**2 + (d[1] - v[1])**2)}
end

def bocce_score(balls)
  v = balls[-1][:distance]
  r, b = bocce_score_helper(balls, 'red', v), bocce_score_helper(balls, 'black', v)
  rc, bc = r.count{|e| e < b.min}, b.count{|e| e < r.min}
  b.min < r.min ? "black scores #{bc}" : b.min > r.min ? "red scores #{rc}" : 'No points scored'
end
