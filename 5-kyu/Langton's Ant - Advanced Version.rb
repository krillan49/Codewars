#===============================================================================================================
#                                               Description
#===============================================================================================================

# Langton's ant moves on a regular grid of squares that are coloured either black or white. The ant is always oriented in one of the cardinal directions (left, right, up or down) and moves according to the following rules:

# if it is on a black square, it flips the colour of the square to white, rotates 90 degrees counterclockwise and moves forward one square.
# if it is on a white square, it flips the colour of the square to black, rotates 90 degrees clockwise and moves forward one square.
# Starting with a grid that is entirely white, how many squares are black after n moves of the ant?

# Note: n will go as high as 1020

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. Google visualizations

# 2. The ant moves chaotically only for a little less than 10,000 first moves

# 3. Looped sequence after a certain move is 104 moves

#===============================================================================================================
#                                               Solution
#===============================================================================================================

BC = [0]  # the number of black cells on each move
$dbc = []  # cycle-104 -1 or +1 black cell on each turn of the cycle
CEILS = {[0,0] => 0} # All cells passed in the first 11000 moves
URDL = %w[u r d l] # direction relative to the ant(although this is redundant)

def langtons_ant_counter_11000
  dir, x, y = 0, 0, 0
  11000.times do
    CEILS[[x, y]] ? CEILS[[x, y]] = (CEILS[[x, y]] - 1).abs : CEILS[[x, y]] = 1 # change the color of the cell if it already exists or create a new cell if it doesn't exist
    CEILS[[x, y]] == 1 ? (BC << BC[-1] + 1) : (BC << BC[-1] - 1) # save the number of black cells in this step
    CEILS[[x, y]] == 1 ? dir = (dir == 0 ? 3 : dir - 1) : dir = (dir == 3 ? 0 : dir + 1) # change direction depending on cell color
    URDL[dir] == 'r' ? x += 1 : URDL[dir] == 'd' ? y += 1 : URDL[dir] == 'l' ? x -= 1 : y -= 1
  end
  $dbc = BC[10000..10105].each_cons(2).map{|a, b| b - a}
end

def langtons_ant(n)
  langtons_ant_counter_11000 if BC.size == 1
  n <= 10000 ? BC[n] : BC[10000] + ((n - 10000) / 104) * 12 + $dbc[0...(n-10000)%104].sum
end
