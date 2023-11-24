#===============================================================================================================
#                                               Description
#===============================================================================================================

# A normal deck of 52 playing cards contains suits 'H', 'C', 'D', 'S' - Hearts, Clubs, Diamonds, Spades respectively - and cards with values from Ace (1) to King (13): 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
#
# Your Task
# Complete the function that returns a shuffled deck of 52 playing cards without repeats.
#
# Each card should have format "{suit} {value}", e.g. the Queen of Hearts is "H 12" and the Ace of Spades is "S 1". The order of the cards must be different each time the function is called.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def shuffled_deck
  ['H', 'C', 'D', 'S'].map{|e| (1..13).map{|n| "#{e} #{n}"}}.flatten.shuffle
end
