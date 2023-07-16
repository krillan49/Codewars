#===============================================================================================================
#                                               Description
#===============================================================================================================

# Alice and Bob are playing a game. There are n(1≤n≤10**18) cards on the table. The aim of the game is to collect the most cards. The rules:
#
# if the number of cards is even, the players can either take half of the cards from the stack, or only 1 card -- as they choose;
# if the number of cards is odd, the players must take 1 card.
# Alice starts the game.
#
# Return the maximum number of cards Alice can collect, if Bob plays optimally (tries to get as many cards as possible for himself).
#
# Example
# When there are 10 cards, Alice can collect maximum 8, like this:
#
# 1. Alice takes half of the 10 cards     (now has: 5)          -->  5 cards left
# 2. Bob must take 1 card                 (now has: 1)          -->  4 cards left
# 3. Alice takes half of the 4 cards      (now has: 5 + 2 = 7)  -->  2 cards left
# 4. Bob takes 1 (or half of the 2 cards) (now has: 1 + 1 = 2)  -->  1 card left
# 5. Alice takes the last card            (now has: 7 + 1 = 8)  -->  game over!
#
# Thus, Alice has 8 cards and Bob has 2

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def card_game(n)
  res = 0
  until n <= 0
    m = n.odd? || ((n/2).even? && n != 4) ? 1 : n/2
    res += m
    n -= 2*n
    n.odd? || ((n/2).even? && n != 4) ? n -= 1 : n -= n/2
  end
  res
end
