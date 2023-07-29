#===============================================================================================================
#                                               Description
#===============================================================================================================

# Welcome Warrior! Let's play a game!
#
# You've gotten challenged by a lot of kata, now it's time for you to challenge the kata!
#
# In a room is a table with a pile of cakes. One of these cakes is poisoned. Every turn, we will take cakes from this pile and eat them, leaving the last one to be the poisoned cake. Whoever eats the poisoned cake will die. The poisoned cake is clearly marked, so you do not have to guess. Rather you need to rely on logic to save you.
#
# The rules are simple:
# Do not eat the last cake. It's obivious that the poisoned cake will be the last to be eaten, so, DON'T EAT THE LAST CAKE. Try to make your opponent eat it.
#
# When it is your turn, you can only take one, two or three cakes. The same rules apply to your opponent on their turn. You cannot skip your move, so choose wisely how many cakes to eat. Both opponents will be able to see how many cakes the other eats on each turn.
#
# You cannot copy your opponent's previous move; likewise they cannot copy yours. If your opponent takes one cake, next move you can only choose between two and three. If you take three cakes, your opponent can only choose one or two. This doesn't effect the first move, only subsequent ones.
#
# If one of the players has no valid moves (ie. one cake left and previous move was one cake), that player will skip their turn. Then the other player will be forced to eat the last cake. This is the ONLY case of turn skipping.
#
# You can choose whether or not to go first. This decision is key to victory, so don't hurry, choose wisely!
#
# Task of this kata:
# To solve this kata, you should write class called Player. This class has one constructor and two other functions:
#
# class Player
#   # called at the beginning of each game. Parameter: a number of cakes on table.
#   def initialize(cakes)
#   end
#   # called after constructor.
#   # Parameter: number of cakes on table left (same as in constructor).
#   # Must return true if you want to move first, false is you want to move after your opponent.
#   def firstmove(cakes)
#   end
#   # called before each of your moves.
#   # First parameter: number of cakes left on table.
#   # Second parameter: amount of cakes took by your opponent last move.
#   # Must return 1, 2 or 3 depending of how much cakes you want to take.
#   def move(cakes, last)
#     last == 1 ? 2 : 1 # I'm not greedy
#   end
# end
# Each test is a different game and different instance of the Player class. You should not worry about calling functions, you should only watch the number of cakes on table and decide on every move how many to take, and decide who moves first.
#
# Write your Player class and beat your opponent! You must figure out a strategy that can guarantee you a victory.
#
# Example:
# class Player
#   def initialize(cakes)
#   end
#   # Decide who move first - player or opponent (return true if player)
#   def firstmove(cakes)
#     true # I want to move first
#   end
#   # Decide your next move (return 1, 2 or 3)
#   def move(cakes, last)
#     last == 1 ? 2 : 1 # I'm not greedy
#   end
# end
# Example of game:
# 12 cakes on the table. You decide to move first.
#
# You eat 1 cake, 11 cakes left.
#
# Opponent eats 3 cakes, 8 cakes left.
#
# You eat 2 cakes, 6 cakes left.
#
# Opponent eats 1 cake, 5 cakes left.
#
# You eat 3 cakes, 2 cakes left.
#
# Opponent has no winning choice. If he eats 2 cakes, he will lose. If he eats 1 cake, you will be left in stalemate situation, and he will again eat 1 cake and lose.
#
# You win.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Player
  def initialize(cakes)
    @cakes = cakes
  end

  def firstmove(cakes)
    cakes <= 2 || (cakes - 2) % 4 == 0 ? false : true
  end

  def move(cakes, last)
    if (cakes - 3) % 4 == 0
      1
    elsif cakes % 4 == 0
      last == 2 ? 3 : 2
    elsif (cakes - 1) % 4 == 0
      3
    end
  end
end
