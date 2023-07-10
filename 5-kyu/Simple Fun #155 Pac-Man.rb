#===============================================================================================================
#                                               Description
#===============================================================================================================

# Pac-Man got lucky today! Due to minor performance issue all his enemies have frozen. Too bad Pac-Man is not brave enough to face them right now, so he doesn't want any enemy to see him.
#
# Given a gamefield of size N x N, Pac-Man's position(PM) and his enemies' positions(enemies), your task is to count the number of coins he can collect without being seen.
#
# An enemy can see a Pac-Man if they are standing on the same row or column.
#
# It is guaranteed that no enemy can see Pac-Man on the starting position. There is a coin on each empty square (i.e. where there is no Pac-Man or enemy).
#
# Example
# For N = 4, PM = [3, 0], enemies = [[1, 2]], the result should be 3.
#
# Let O represent coins, P - Pac-Man and E - enemy.
# OOOO
# OOEO
# OOOO
# POOO
# Pac-Man cannot cross row 1 and column 2.
#
# He can only collect coins from points (2, 0), (2, 1) and (3, 1), like this:
#
# x is the points that Pac-Man can collect the coins.
# OOOO
# OOEO
# xxOO
# PxOO
# Input/Output
# [input] integer N
# The field size.
#
# [input] integer array PM
# Pac-Man's position (pair of integers)
#
# [input] 2D integer array enemies
# Enemies' positions (array of pairs)
#
# [output] an integer
# Number of coins Pac-Man can collect.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def pm_helper(field, pm, c, fx = [])
  field.each.with_index{|a, i| a.include?(c) && i < pm[0] ? fx = [] : a.include?(c) && i > pm[0] ? break : fx << a }
  fx
end

def pac_man(n, pm, enemies)
  return n * n - 1 if enemies == []
  field = Array.new(n){Array.new(n,0)}
  enemies.each{|a| field[a[0]][a[1]] = 'E'}
  field[pm[0]][pm[1]] = 'P'
  field = field.transpose.map{|a| a.include?('E') ? a.map{|e| e == 'E' ? e : 'x'} : a}.transpose
  field = pm_helper(field, pm, 'E').transpose
  pm2 = []
  field.each.with_index{|a, i| a.each_with_index{|e, j| pm2 = [i, j] if e == 'P'}}
  pm_helper(field, pm2, 'x').flatten.size - 1
end
