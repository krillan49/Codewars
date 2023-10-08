#===============================================================================================================
#                                               Description
#===============================================================================================================

# Pero has been into robotics recently, so he decided to make a robot that checks whether a deck of poker cards is complete.
#
# He’s already done a fair share of work - he wrote a programme that recognizes the suits of the cards. For simplicity’s sake, we can assume that all cards have a suit and a number.
#
# The suit of the card is one of the characters "P", "K", "H", "T", and the number of the card is an integer between 1 and 13. The robot labels each card in the format TXY where T is the suit and XY is the number. If the card’s number consists of one digit, then X = 0. For example, the card of suit "P" and number 9 is labelled "P09".
#
# A complete deck has 52 cards in total. For each of the four suits there is exactly one card with a number between 1 and 13.
#
# The robot has read the labels of all the cards in the deck and combined them into the string s.
#
# Your task is to help Pero finish the robot by writing a program that reads the string made out of card labels and returns the number of cards that are missing for each suit.
#
# If there are two same cards in the deck, return array with [-1, -1, -1, -1] instead.
#
# Input/Output
# [input] string s
# A correct string of card labels. 0 ≤ |S| ≤ 1000
#
# [output] an integer array
# Array of four elements, representing the number of missing card of suits "P", "K", "H", and "T" respectively. If there are two same cards in the deck, return [-1, -1, -1, -1] instead.
#
# Example
# For s = "P01K02H03H04", the output should be [12, 12, 11, 13].
#
# 1 card from "P" suit, 1 card from "K" suit, 2 cards from "H" suit, no card from "T" suit.
#
# For s = "H02H10P11H02", the output should be [-1, -1, -1, -1].
#
# There are two same cards "H02" in the string s.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def cards_and_pero(s)
  c = s.chars.each_slice(3).to_a
  return [-1, -1, -1, -1] if c.uniq != c
  [*%w[P K H T].map{|e| 13 - c.count{|a| a[0] == e}}]
end
