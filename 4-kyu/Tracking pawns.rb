#===============================================================================================================
#                                               Description
#===============================================================================================================

# A chess board is normally played with 16 pawns and 16 other pieces, for this kata a variant will be played with only the pawns. All other pieces will not be on the board.
# For information on how pawns move, refer here
#
# Write a function that can turn a list of pawn moves into a visual representation of the resulting board.
# A chess move will be represented by a string,
#
# "c3"
# This move represents a pawn moving to c3. If it was white to move, the move would represent a pawn from c2 moving to c3. If it was black to move, a pawn would move from c4 to c3, because black moves in the other direction.
# The first move in the list and every other move will be for white's pieces.
#
# The letter represents the column, while the number represents the row of the square where the piece is moving
#
# Captures are represented differently from normal moves:
#
# "bxc3"
# represents a pawn on the column represented by 'b' (the second column) capturing a pawn on c3.
#
# For the sake of this kata a chess board will be represented by a list like this one:
#
# [[".",".",".",".",".",".",".","."],
#  ["p","p","p","p","p","p","p","p"],
#  [".",".",".",".",".",".",".","."],
#  [".",".",".",".",".",".",".","."],
#  [".",".",".",".",".",".",".","."],
#  [".",".",".",".",".",".",".","."],
#  ["P","P","P","P","P","P","P","P"],
#  [".",".",".",".",".",".",".","."]]
# Here is an example of the board with the squares labeled:
#
# [["a8","b8","c8","d8","e8","f8","g8","h8"],
#  ["a7","b7","c7","d7","e7","f7","g7","h7"],
#  ["a6","b6","c6","d6","e6","f6","g6","h6"],
#  ["a5","b5","c5","d5","e5","f5","g5","h5"],
#  ["a4","b4","c4","d4","e4","f4","g4","h4"],
#  ["a3","b3","c3","d3","e3","f3","g3","h3"],
#  ["a2","b2","c2","d2","e2","f2","g2","h2"],
#  ["a1","b1","c1","d1","e1","f1","g1","h1"]]
# White pawns are represented by capital 'P' while black pawns are lowercase 'p'.
#
# A few examples
#
# If the list/array of moves is: ["c3"]
# >>>
# [[".",".",".",".",".",".",".","."],
#  ["p","p","p","p","p","p","p","p"],
#  [".",".",".",".",".",".",".","."],
#  [".",".",".",".",".",".",".","."],
#  [".",".",".",".",".",".",".","."],
#  [".",".","P",".",".",".",".","."],
#  ["P","P",".","P","P","P","P","P"],
#  [".",".",".",".",".",".",".","."]]
# add a few more moves,
#
# If the list/array of moves is: ["d4", "d5", "f3", "c6", "f4"]
# >>>
# [[".",".",".",".",".",".",".","."],
#  ["p","p",".",".","p","p","p","p"],
#  [".",".","p",".",".",".",".","."],
#  [".",".",".","p",".",".",".","."],
#  [".",".",".","P",".","P",".","."],
#  [".",".",".",".",".",".",".","."],
#  ["P","P","P",".","P",".","P","P"],
#  [".",".",".",".",".",".",".","."]]
# now to add a capture...
#
# If the list/array of moves is: ["d4", "d5", "f3", "c6", "f4", "c5", "dxc5"]
# >>>
# [[".",".",".",".",".",".",".","."],
#  ["p","p",".",".","p","p","p","p"],
#  [".",".",".",".",".",".",".","."],
#  [".",".","P","p",".",".",".","."],
#  [".",".",".",".",".","P",".","."],
#  [".",".",".",".",".",".",".","."],
#  ["P","P","P",".","P",".","P","P"],
#  [".",".",".",".",".",".",".","."]]
# If an invalid move (a move is added that no pawn could perform, a capture where there is no piece, a move to a square where there is already a piece, etc.) is found in the list of moves, return '(move) is invalid'.
#
# If the list/array of moves is: ["e6"]
# >>>
# "e6 is invalid"
# If the list/array of moves is: ["e4", "d5", "exf5"]
# >>>
# "exf5 is invalid"
# The list passed to pawn_move_tracker / PawnMoveTracker.movePawns will always be a list of strings in the form (regex pattern): [a-h][1-8] or [a-h]x[a-h][1-8].
#
# Notes:
# In the case of a capture, the first lowercase letter will always be adjacent to the second in the alphabet, a move like axc5 will never be passed.
# A pawn can move two spaces on its first move
# There are no cases with the 'en-passant' rule.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

chess_cells = 8.downto(1).map{|n| ('a'..'h').map{|c| "#{c}#{n}"}}.flatten
coordinates = (0..7).map{|y| (0..7).map{|x| {y: y, x: x}}}.flatten
IS = chess_cells.zip(coordinates).to_h # 'a8'=>{y:0,x:0},'b8'=>{y:0,x:1},'c8'=>{y:0,x:2} ...

def make_move(board, m, step2cell, startpos, step1cell, forstep, forattk, our, enemy)
  if m.size == 2 # Just a move
    if IS[m][:y] == step2cell && board[step2cell][IS[m][:x]] == '.' && board[startpos][IS[m][:x]] == our
      board[startpos][IS[m][:x]] = '.'
      board[step2cell][IS[m][:x]] = our # Move to a position where a 2nd is possible
    elsif board[IS[m][:y]][IS[m][:x]] == '.' && board[IS[m][:y].send(forstep, 1)][IS[m][:x]] == our
      board[IS[m][:y].send(forstep, 1)][IS[m][:x]] = '.'
      board[IS[m][:y]][IS[m][:x]] = our # Move to other positions
    else
      return "#{m} is invalid"
    end
  elsif m.size == 4 # Attack
    to = m[2..-1]
    from = m[0] + "#{to[1].to_i.send(forattk, 1)}" #  The opposite sign. Because not indices but chess cells
    return "#{m} is invalid" if board[IS[from][:y]][IS[from][:x]] != our || board[IS[to][:y]][IS[to][:x]] != enemy
    board[IS[to][:y]][IS[to][:x]] = our
    board[IS[from][:y]][IS[from][:x]] = '.'
  end
  board
end

def pawn_move_tracker(moves)
  board = [
    [".",".",".",".",".",".",".","."],
    ["p","p","p","p","p","p","p","p"],
    [".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".","."],
    [".",".",".",".",".",".",".","."],
    ["P","P","P","P","P","P","P","P"],
    [".",".",".",".",".",".",".","."]
  ]
  moves.each.with_index do |m, i|
    if i.even? # White
      res = make_move(board, m, 4, 6, 5, '+', '-', 'P', 'p')
      res == "#{m} is invalid" ? (return res) : board = res
    else # Black
      res = make_move(board, m, 3, 1, 2, '-', '+', 'p', 'P')
      res == "#{m} is invalid" ? (return res) : board = res
    end
  end
  board
end
