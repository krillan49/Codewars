#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a list of white pawns on a chessboard (any number of them, meaning from 0 to 64 and with the possibility to be positioned everywhere), determine how many of them have their backs covered by another. Pawns attacking upwards since we have only white ones.
#
# Please remember that a pawn attack(and defend as well) only the 2 square on the sides in front of him. https://en.wikipedia.org/wiki/Pawn_(chess)#/media/File:Pawn_(chess)_movements.gif
#
# This is how the chess board coordinates are defined:
#
#
#   A	 B	C	 D	E	 F G	H
# 8	♜	♞	♝	♛	♚	♝	♞	♜
# 7	♟	♟	♟	♟	♟	♟	♟	♟
# 6
# 5
# 4
# 3
# 2	♙	♙	♙	♙	♙	♙	♙	♙
# 1	♖	♘	♗	♕	♔	♗	♘	♖

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def covered_pawns(pawns)
  p = pawns.map{|w| [w[0].ord - 96, w[1].to_i]}
  p.count{|a| p.include?([a[0]+1, a[1]-1]) or p.include?([a[0]-1, a[1]-1])}
end
