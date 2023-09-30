#===============================================================================================================
#                                               Description
#===============================================================================================================

# I had just finished a kata for checking sudoku solutions and wanted a bit more of a challenge, I hope to build a fully working sudoku do-er thing in ruby and figured I'd make some new kata at the same time.
#
# The first is nice and simple, there will be only one element missing from each row of the board, eventually we'll move on to much more complex puzzles.
#
# For more on the rules; https://en.wikipedia.org/wiki/Sudoku

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sudokuer(puzzle)
  puzzle.each{|a| a[a.index(0)] = ((1..9).to_a - a).max }
end
