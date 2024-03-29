#===============================================================================================================
#                                               Description
#===============================================================================================================

# Introduction
# A new casino has come to Las Vegas, but this casino does not want to have human staff, but they want to implement a series of computer systems that automate the process. After looking for references and recommendations, the administrative team has decided to hire you to develop these systems.
#
# Your assignment is to complete the function that draws cards for the dealer, and returns the players who have won.
#
# Rules
# Each table will consist of 3 players, "Player 1", "Player 2", "Player 3"
# Players play against the croupier (dealer) only, not against other players.
# Each card has its value: the numerals are worth whatever their number indicates; "J", "Q" and "K" are worth 10; "A" may be worth 11 or 1, always trying to keep the highest score possible.
# If any player exceeds 21 points, they lose.
# The croupier must draw from a deck until it's hand scores 17 or more points.
# A player has a blackjack when they have 2 cards, one worth 10, and an "A"
# If the player has a blackjack, then they win, unless the croupier also has a blackjack.
# When the croupier draws a card, the croupier draws the first card from a deck.
# Notes:
#
# The inputs will never be null.
# All letters are in uppercase
# Examples
# Player 1: "J", "A" (21, blackjack)
# Player 2: "10", "5", "6" (21)
# Player 3: "3", "6", "A", "3", "A", "K" (24)
# Croupier: "9", "7" (16)
# Deck: "5", "4", "K", "2"
# Since the dealer has less than 17 points, it must draw a card:
#
# Croupier: "9", "7", "5" (21)
# Deck: "4", "K", "2"
# Now comparing hands:
#
# Player 1 scores 21, croupier scores 21, but Player 1 has Black Jack, so Player 1 won
# Player 2 scores 21, croupier scores 21, draw
# Player 3 scores 24, Player 3 exceeded 21, so he lost
# So return ["Player 1"]
#
# And another example:
#
# Player 1: "10", "K" (20)
# Player 2: "10", "2", "6" (18)
# Player 3: "8", "8", "5" (21)
# Croupier: "5", "10" (15)
# Deck: "A" , "3" , "K" , "2"
# Since the dealer has less than 17 points, it must draw more cards:
#
# Croupier: "5", "10", "A", "3" (19)
# Deck: "K", "2"
# Now comparing hands:
#
# Player 1 scores 20, croupier scores 19, Player 1 won
# Player 2 scores 18, croupier scores 19, Player 2 lost
# Player 3 scores 21, croupier scores 19, Player 3 won
# So return ["Player 1", "Player 3"]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def score_unit(hand)
  hh = {'A'=>[11,1], 'K'=>[10], 'Q'=>[10], 'J'=> [10]}
  hand = hand.map{|card| hh[card] ? hh[card] : [card.to_i]}
  hand = hand[0].product(*hand[1..-1]).reject{|a| a.sum > 21}
  hand == [] ? 0 : hand.any?{|a| a.sum == 21 && a.size == 2} ? 99 : hand.map(&:sum).max
end

def dealer_more(dealer, deck)
  deck.each do |card|
    dealer << card
    new_score = score_unit(dealer)
    return new_score if new_score >= 17 || new_score == 0
  end
end

def winners(player1, player2, player3, dealer, deck)
  score = [player1, player2, player3, dealer].map{|pl| score_unit(pl)}
  score[3] = dealer_more(dealer, deck) if score[3] < 17
  score[0..2].map.with_index(1){|sc,i| sc > score[3] ? "Player #{i}" : nil}.compact
end
