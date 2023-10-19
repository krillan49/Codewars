#===============================================================================================================
#                                               Description
#===============================================================================================================

# #Source
#
# This kata is an application of a magic trick. This magic trick is based on a mathematic algorithm: the Zeckendorf theorem:
#
# Every positive integer can be expressed uniquely as a sum of distinct non-consecutive Fibonacci numbers.
# Don't be afraid, you don't need to understand the theorem to solve this kata.
#
# #Magic Trick Description
#
# Here is how the magic trick work:
#
# Ask the spectator to choose a number between 0 and 100 (included)
# Give a special set of card to the spectator, these cards contains a list of numbers. Here is what the cards look like: https://blogdemaths.files.wordpress.com/2013/01/cartes-magiques.pdf
# Ask the spectator to give you back only the cards where his number is written on it.
# You can guess the number of your spectator
# #Magic Trick Explanation
#
# You just need to sum the first number on each card and TADAM. In practice you could ask numbers much higher (with 10 cards it can go up to 231) but that would make really long cards.
#
# #Objective
#
# We will consider that each presented card has an "index" on it to recognize it. Those cards are already given to you. Write a class magicZ with 2 functions gueZZ([indexes of card]) and getMagicZindex(n).
#
# gueZZ(indexes) takes an array being the index of each card and return the guessed number
# getMagicZindex(n) takes a number and return the list of indexes for this value (the number can be higher than 100)
# ##Example: I chose number 70:
#
# gueZZ([1,5,8]) === 70
# getMagicZindex(70) = [1,5,8]
# ##Note The spectator is always going to try to trick. Be prepared to receive duplicated cards (ignore the duplicates) or fewer cards than expected (respond with 0).
#
# ##Next If you think this kata was too simple, you can try to generate the cards used in this kata, here: http://www.codewars.com/kata/zeckendorf-cards-generator .

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class MagicZ
  def initialize
    @cards=[]
    @cards+=[[1,4,6,9,12,14,17,19,22,25,27,30,33,35,38,40,43,46,48,51,53,56,59,61,64,67,69,72,74,77,80,82,85,88,90,93,95,98]]
    @cards+=[[2,7,10,15,20,23,28,31,36,41,44,49,54,57,62,65,70,75,78,83,86,91,96,99]]
    @cards+=[[3,4,11,12,16,17,24,25,32,33,37,38,45,46,50,51,58,59,66,67,71,72,79,80,87,88,92,93,100]]
    @cards+=[[5,6,7,18,19,20,26,27,28,39,40,41,52,53,54,60,61,62,73,74,75,81,82,83,94,95,96]]
    @cards+=[[8,9,10,11,12,29,30,31,32,33,42,43,44,45,46,63,64,65,66,67,84,85,86,87,88,97,98,99,100]]
    @cards+=[[13,14,15,16,17,18,19,20,47,48,49,50,51,52,53,54,68,69,70,71,72,73,74,75]]
    @cards+=[[21,22,23,24,25,26,27,28,29,30,31,32,33,76,77,78,79,80,81,82,83,84,85,86,87,88]]
    @cards+=[[34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54]]
    @cards+=[[55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88]]
    @cards+=[[89,90,91,92,93,94,95,96,97,98,99,100]]
  end

  def gueZZ(indexes=[])
    @cards.select.with_index{|e, i| indexes.uniq.include?(i)}.map{|a| a[0]}.sum rescue 0
  end

  def get_magicZ_index(n)
    @cards.map.with_index{|a, i| a.include?(n) ? i : nil}.compact
  end
end
