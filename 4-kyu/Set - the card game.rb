#===============================================================================================================
#                                               Description
#===============================================================================================================

# There is a game called SET, where the goal is to find 3 cards that match some criterias. Each card has 4 attributes:
#
# count: 1, 2 or 3
# colour: red, blue or green
# shape: rectangular, oval or wave
# filling: plain, shaded or empty
# Every possible combination is represented (except if you loose a card, but this is a computer game, so no lost cards!), so in total there are 3 ^ 4 = 81 cards.
#
# In order for 3 cards to form a set, EACH of the attributes of the three cards has to be either the same or completely different. So you can have for the color
#
# red + red + red
# red + green + blue
# but NOT
#
# red + red + blue
# Some examples for all 4 attributes:
#
# SET: 1 red plain rect + 2 red plain rect + 3 red plain rect
# SET: 1 red plain rect + 1 green plain rect + 1 blue plain rect
# NOT a SET: 1 red plain rect + 2 red plain rect + 3 red plain oval -> 2 rectangulars and 1 oval
# NOT a SET: 1 red plain rect + 1 green plain rect + 1 blue shaded rect -> 2 plain and 1 shaded
# In the game a total of 12 cards are laid on the table, in a 4 x 3 grid, and the goal is to find as many NON-OVERLAPPING SETS as possible.
#
# A card is defined as
#
# Card = Struct.new( :count, :color, :shape, :filling )
# and every attribute is either 1, 2 or 3.
#
# Your method has to take a 2D-array of cards and return an array of solutions. The 2D-array is set up as
#
# cards[x][y]
# with
# 0 <= x <= 3
# and
# 0 <= y <= 2
# and the result has to return [ x, y ] - tuples. Here are some possible results:
#
# [] - no SET found
# [ [ [ 0,0 ], [ 1,2 ], [1,3 ] ] ] - found 1 SET
# [ [ [ 0,0 ], [ 1,2 ], [1,3 ] ], [ [ 2,2 ], [ 3,2 ], [1,1 ] ] ] - found 2 SETs
# The following IS NOT A VALID RESULT, because the card at [1,2] is used twice!
#
# [ [ [ 0,0 ], [ 1,2 ], [1,3 ] ], [ [ 2,2 ], [ 3,2 ], [1,2 ] ] ] - found 2 SETs
# Take care to
#
# not use cards twice
# have as much solutions as possible (there are cases where you could have different number of solutions...)
# make it simple ;)
# The testing algorithm tries very hard to be fair, that is, to accept as many results as possible. Your solution for a given set is considered correct, if:
#
# you return the maximum number of solutions
# every given solution is correct
# no card is used twice

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. Sample input:
class Card
  attr_reader :count, :color, :shape, :filling
  def initialize(count, color, shape, filling)
    @count, @color, @shape, @filling = count, color, shape, filling
  end
end
# input:
cards = [
  [Card.new(1, 1, 1, 1), Card.new(1, 2, 1, 2), Card.new(1, 1, 2, 2)],
  [Card.new(2, 1, 1, 1), Card.new(2, 2, 1, 2), Card.new(2, 1, 2, 2)],
  [Card.new(3, 1, 1, 1), Card.new(3, 1, 1, 2), Card.new(3, 1, 3, 2)],
  [Card.new(2, 2, 2, 2), Card.new(1, 2, 2, 2), Card.new(1, 2, 2, 3)]
]

# 2. All combinations of 3 out of 12 is not that much, brute force will do.

# 3. Think about how to properly sort all matching sets, this will help eliminate repetitions

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_solutions(cards)
  # 1 - create a hash to combine values and indices {[1, 1, 2, 2] => [0, 2]}
  hh = {}
  cards.each.with_index do |arr,i|
    arr.each.with_index do |obj,j|
      hh[[obj.count, obj.color, obj.shape, obj.filling]] = [i,j]
    end
  end
  # hh == {
  #   [1, 1, 1, 1]=>[0, 0], [1, 2, 1, 2]=>[0, 1], [1, 1, 2, 2]=>[0, 2],
  #   [2, 1, 1, 1]=>[1, 0], [2, 2, 1, 2]=>[1, 1], [2, 1, 2, 2]=>[1, 2],
  #   [3, 1, 1, 1]=>[2, 0], [3, 1, 1, 2]=>[2, 1], [3, 1, 3, 2]=>[2, 2],
  #   [2, 2, 2, 2]=>[3, 0], [1, 2, 2, 2]=>[3, 1], [1, 2, 2, 3]=>[3, 2]
  # }

  # 2. All possible combinations
  sets = hh.keys.combination(3).select{|arr| arr.transpose.all?{|ar| ar.uniq.size != 2} }.map{|arr| arr.map{|ar| hh[ar]}}

  # 3. How many times each card occurs in all combinations
  acards = sets.flatten(1).group_by{|e| e}.map{|k, v| [k, v.size]}.to_h

  # 4. We sort the combinations from the smallest by the amount of uses of each card in all possible combinations
  sets = sets.sort_by{|a,b,c| [acards[a], acards[b], acards[c]].sum}

  # 5. We select combinations, excluding those in which there are the same cards as in the previously selected
  res, incards = [], []
  sets.each do |set|
    if incards.all?{|card| !set.include?(card)}
      res << set
      incards += set
    end
  end
  res
end
