#===============================================================================================================
#                                               Description
#===============================================================================================================

# Take a look at wiki description of Connect Four game:
#
# Wiki Connect Four
#
# The grid is 6 row by 7 columns, those being named from A to G.
#
# You will receive a list of strings showing the order of the pieces which dropped in columns:
#
#   pieces_position_list = ["A_Red",
#                           "B_Yellow",
#                           "A_Red",
#                           "B_Yellow",
#                           "A_Red",
#                           "B_Yellow",
#                           "G_Red",
#                           "B_Yellow"]
# The list may contain up to 42 moves and shows the order the players are playing.
#
# The first player who connects four items of the same color is the winner.
#
# You should return "Yellow", "Red" or "Draw" accordingly.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Connect4
  def initialize
    @field = Array.new(6){Array.new(7, 'o')}
    @players = %w[r e]
    @counter = 1
  end

  def play(num)
    @counter = (@counter - 1).abs

    @field.reverse.each_with_index do |arr, i|
      if arr[num] != 'o' && i == 5
        @counter = (@counter - 1).abs
        return "Column full!"
      elsif arr[num] == 'o'
        arr[num] = @players[@counter]
        break
      end
    end

    (@field + @field.transpose).each{|arr| return "Player #{@counter + 1} wins!" if arr.join.include?(@players[@counter] * 4)}
    diaginals.each{|arr| return "Player #{@counter + 1} wins!" if arr.join.include?(@players[@counter] * 4)}

    "Player #{@counter + 1} has a turn"
  end

  private

  def diaginals
    [@field, @field.reverse].map do |arr|
      pattern = (0..arr.size-1).map{|i| [nil] * i}
      pattern.reverse.zip(arr).zip(pattern).map(&:flatten).transpose.map(&:compact)
    end.flatten(1)
  end
end

def who_is_winner(list)
  game = Connect4.new
  p1, p2 = list[0].split('_')[1], list[1].split('_')[1]
  list.map{|e| e.split('_')[0].ord - 65}.each do |n|
    step = game.play(n)
    return p1 if step == 'Player 1 wins!'
    return p2 if step == 'Player 2 wins!'
  end
  'Draw'
end
