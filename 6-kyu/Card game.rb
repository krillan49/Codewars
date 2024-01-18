#===============================================================================================================
#                                               Description
#===============================================================================================================

# Lеt's create function to play cards. You receive 3 arguments: card1 and card2 are cards from a single deck; trump is the main suit, which beats all others.
#
# You have a preloaded deck (in case you need it):
#
# deck = ["joker","2♣","3♣","4♣","5♣","6♣","7♣","8♣","9♣","10♣","J♣","Q♣","K♣","A♣",
#                 "2♦","3♦","4♦","5♦","6♦","7♦","8♦","9♦","10♦","J♦","Q♦","K♦","A♦",
#                 "2♥","3♥","4♥","5♥","6♥","7♥","8♥","9♥","10♥","J♥","Q♥","K♥","A♥",
#                 "2♠","3♠","4♠","5♠","6♠","7♠","8♠","9♠","10♠","J♠","Q♠","K♠","A♠"]
# Game rules
# If both cards have the same suit, the higher one wins
# If both cards have trump, the higher one wins
# If the cards have different suits and no one has trump, return "Let us play again."
# If one card has trump, but not the other, the one with the trump wins
# If there is a winner, return "The first/second card won."
# If the two cards are the same, return "Someone cheats."
# The joker always wins
# Examples
# "3♣", "Q♣", "♦"  -->  "The second card won."
# "5♥", "A♣", "♦"  -->  "Let us play again."
# "8♠", "8♠", "♣"  -->  "Someone cheats."
# "2♦", "A♠", "♦"  -->  "The first card won."
# "joker", "joker", "♦"  -->  "Someone cheats."

#===============================================================================================================
#                                               Solution
#===============================================================================================================

SCORE = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def card_game(card1, card2, trump)
  if card1 == card2
    'Someone cheats.'
  elsif [card1, card2].any?{|c| c == 'joker'}
    card1 == 'joker' ? 'The first card won.' : 'The second card won.'
  elsif card1[-1] == card2[-1]
    SCORE.index(card1[0...-1]) > SCORE.index(card2[0...-1]) ? 'The first card won.' : 'The second card won.'
  elsif [card1, card2].any?{|c| c[-1] == trump}
    card1[-1] == trump ? 'The first card won.' : 'The second card won.'
  else
    'Let us play again.'
  end
end
