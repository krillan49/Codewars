#===============================================================================================================
#                                               Description
#===============================================================================================================

# Reversi is a game usually played by 2 people on a 8x8 board. Here we're only going to consider a single 8x1 row.
#
# Players take turns placing pieces, which are black on one side and white on the other, onto the board with their colour facing up. If one or more of the opponents pieces are sandwiched by the piece just played and another piece of the current player's colour, the opponents pieces are flipped to the current players colour.
#
# Note that the flipping stops when the first piece of the player's colour is reached.
#
# Task:
# Your task is to take an array of moves and convert this into a string representing the state of the board after all those moves have been played.
#
# Input:
# The input to your function will be an array of moves. Moves are represented by integers from 0 to 7 corresponding to the 8 squares on the board. Black plays first, and black and white alternate turns. Input is guaranteed to be valid. (No duplicates, all moves in range, but array may be empty)
#
# Output:
# 8 character long string representing the final state of the board. Use '*' for black and 'O' for white and '.' for empty.
#
# Examples:
#   reversi_row([])      # '........'
#   reversi_row([3])     # '...*....'
#   reversi_row([3,4])   # '...*O...'
#   reversi_row([3,4,5]) # '...***..'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def reversi_row(moves)
  str = '........'
  moves.each.with_index do |i, j|
    j.even? ? (str[i] = '*'; a = '*'; b = 'O') : (str[i] = 'O'; a = 'O'; b = '*')
    if i > 1 && str[i-1] == b
      n = 2
      while i - n >= 0
        if str[i-n] == a
          (i-n..i).each{|k| str[k] = a}
        elsif str[i-n] == '.'
          break
        end
        n += 1
      end
    end
    if i < 6 && str[i+1] == b
      n = 2
      while i + n <= 7
        if str[i+n] == a
          (i..n+i).each{|k| str[k] = a}
        elsif str[i+n] == '.'
          break
        end
        n += 1
      end
    end
  end
  str
end
