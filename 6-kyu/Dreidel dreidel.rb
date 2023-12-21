#===============================================================================================================
#                                               Description
#===============================================================================================================

# Let's play a fun gambling game. A dreidel has four sides. Below are the descriptions for each of them:
#
# Nun - nothing happens
# Gimel - you take the pot!
# Hei - you take half the pot
# Shin - you put a piece into the pot
# So here's how we play. You, being a raging gambling addict, start with all of your hard earned coins - oy vei! The pot will also have some non-negative amount of coins when the game begins. Create a function that given an array of dreidel rolls ordered from first to last (so rolls[0] is the first roll and rolls[rolls.length - 1] is the last roll), the number of coins in your account, and the number of coins in the pot, returns the number of coins left in your account after the last roll.
#
# For instance:
#
# gamble(['Hei', 'Shin'], 10, 20) -> 19
# gamble(['Hei', 'Hei'], 10, 20) -> 25
# gamble(['Nun', 'Nun', 'Shin', 'Gimel', 'Shin'], 10, 20) -> 29
# gamble(['Shin', 'Shin', 'Hei'], 10, 20) -> 19
# Notes:
#
# Only worry about whole numbers, round down for fractions
# The game is over only when all rolls have been completed! This means you can have a negative account balance at the end of the game, just like real gambling :)
# The passed variables my_coins and pot will always start non-negative.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def gamble(rolls, c, p)
  rolls.each do |r|
    if r == 'Gimel'
      c += p
      p = 0
    elsif r == 'Hei'
      c += p/2
      p -= p/2
    elsif r == 'Shin'
      c -= 1
      p += 1
    end
  end
  c
end
