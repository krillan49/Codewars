#===============================================================================================================
#                                               Description
#===============================================================================================================

# We all love to play games especially as children. I have fond memories playing Connect 4 with my brother so decided to create this Kata based on the classic game. Connect 4 is known as several names such as “Four in a Row” and “Captain’s Mistress" but was made popular by Hasbro MB Games
# Connect 4
# Task
# The game consists of a grid (7 columns and 6 rows) and two players that take turns to drop their discs. The pieces fall straight down, occupying the next available space within the column. The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own discs.
#
# Your task is to create a Class called Connect4 that has a method called play which takes one argument for the column where the player is going to place their disc.
# Rules
# If a player successfully has 4 discs horizontally, vertically or diagonally then you should return "Player n wins!” where n is the current player either 1 or 2.
#
# If a player attempts to place a disc in a column that is full then you should return ”Column full!” and the next move must be taken by the same player.
#
# If the game has been won by a player, any following moves should return ”Game has finished!”.
#
# Any other move should return ”Player n has a turn” where n is the current player either 1 or 2.
#
# Player 1 starts the game every time and alternates with player 2.
#
# The columns are numbered 0-6 left to right.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Connect4
  def initialize
    @field = Array.new(6) {Array.new(7, 'o')}
    @diagonals6x7 = [303, 402, 501, 500, 410, 320, 330, 440, 550, 551, 452, 353].map.with_index do |num, ind|
      j, i, r = num.digits
      ind < 6 ? (0..r).each.with_object([]){|n, d| d << [i+n, j+n]} : (0..r).each.with_object([]){|n, d| d << [i-n, j+n]}
    end
    @player = %w[r e]
    @counter = 1
  end

  def play(num)
    return "Game has finished!" if @game_finish

    @counter += @counter == 0 ? 1 : -1

    @field.reverse.each_with_index do |arr, i|
      if arr[num] != 'o' && i == 5
        @counter += @counter == 0 ? 1 : -1
        return "Column full!"
      elsif arr[num] == 'o'
        arr[num] = @player[@counter]
        break
      end
    end

    @field.reverse.each{|arr| return "Player #{@counter + 1} wins!" if player_wins?(arr)}
    @field.transpose.each{|arr| return "Player #{@counter + 1} wins!" if player_wins?(arr)}
    @diagonals6x7.map{|arr| arr.map{|i, j| @field[i][j]}}.each{|arr| return "Player #{@counter + 1} wins!" if player_wins?(arr)}

    "Player #{@counter + 1} has a turn"
  end

  private

  def player_wins?(arr)
    @game_finish = arr.join.include?(@player[@counter] * 4)
  end
end
