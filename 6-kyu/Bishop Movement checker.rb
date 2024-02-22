#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are doing an excercise for chess class.
#
# Your job given a bishop's start position (pos1 / startPos) find if the end position (pos2 / endPos) given is possible within n moves.
#
# INPUT :
# startPos (1st param) ==> The position at which bishop is at
# endPos   (2nd param) ==> The position at which he is supposed to end at
# number   (3rd param) ==> The number of moves allowed to bishop to move to said position
# BOARD :
# 8 |_|#|_|#|_|#|_|#|
# 7 |#|_|#|_|#|_|#|_|
# 6 |_|#|_|#|_|#|_|#|
# 5 |#|_|#|_|#|_|#|_|
# 4 |_|#|_|#|_|#|_|#|
# 3 |#|_|#|_|#|_|#|_|
# 2 |_|#|_|#|_|#|_|#|
# 1 |#|_|#|_|#|_|#|_|
#    a b c d e f g h
# The board is a 8 x 8 board goes from a1 to h8
#
# BISHOP MOVEMENT :
# The bishop chess piece moves in any direction diagonally. Chess rules state that there is no limit to the number of squares a bishop can travel on the chessboard, as long as there is not another piece obstructing its path. Bishops capture opposing pieces by landing on the square occupied by an enemy piece.
#
# OUTPUT :
# Find out whether within n moves he can move from start pos to end pos. If he can return true, if not return false
#
# NOTES :
# Return true if start and end position are same; even if number of moves is 0
# Both start and end positions will always be valid (so within a1 ---> h8)
# Input positions will always follow this pattern : f1 (i.e : Char(representing one of a-h)Number(represnting one of 1-8) on chess board)
# The alphabet will always be lowercase followed immediately by number no space.
# For our purpose, chess board is always empty, i.e: the bishop is the only one that can be played.
# The number of moves n will always be whole number i.e : 0 or greater.
# Your bishop may only move using its predefined moment method (it may not act like a queen or knight).
# This is part 1 of challenge (part 2 will be listed when its done)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bishop(sp, ep, moves)
  sp, ep = [sp, ep].map{|e| e.tr('abcdefgh','12345678').chars.map(&:to_i)}
  return false if (sp.sum + ep.sum).odd?
  if moves == 0
    sp == ep ? true : false
  elsif moves == 1
    sp.zip(ep).map{|s, e| (s-e).abs}.uniq.size == 1 ? true : false
  else
    true
  end
end
