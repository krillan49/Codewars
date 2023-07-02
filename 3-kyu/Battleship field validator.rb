#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a method that takes a field for well-known board game "Battleship" as an argument and returns true if it has a valid disposition of ships, false otherwise. Argument is guaranteed to be 10*10 two-dimension array. Elements in the array are numbers, 0 if the cell is free and 1 if occupied by ship.
#
# Battleship (also Battleships or Sea Battle) is a guessing game for two players. Each player has a 10x10 grid containing several "ships" and objective is to destroy enemy's forces by targetting individual cells on his field. The ship occupies one or more cells in the grid. Size and number of ships may differ from version to version. In this kata we will use Soviet/Russian version of the game.
#
# https://i.imgur.com/IWxeRBV.png
#
# Before the game begins, players set up the board and place the ships accordingly to the following rules:
# There must be single battleship (size of 4 cells), 2 cruisers (size 3), 3 destroyers (size 2) and 4 submarines (size 1). Any additional ships are not allowed, as well as missing ships.
# Each ship must be a straight line, except for submarines, which are just single cell.
#
# https://i.imgur.com/FleBpT9.png
#
# The ship cannot overlap or be in contact with any other ship, neither by edge nor by corner.
#
# https://i.imgur.com/MuLvnug.png
#
# This is all you need to solve this kata. If you're interested in more information about the game, visit this link.
# https://en.wikipedia.org/wiki/Battleship_(game)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def ship_counter(field, n, field_m, ships)
  field_m.unshift(Array.new(10, 0)).push(Array.new(10, 0))
  field.each_with_index do |arr, i|
    z = 0
    arr.each_with_index do |ceil, j|
      3.downto(n) {|k|
        if ceil == 1 && arr[j..(j+k)].join.include?('1' + '1' * k) && j >= z
          z = j + 1 + k
          if (j == 0 or arr[j-1] == 0) && (arr[j+1+k] == 0 or j == 9 - k) # проверяем 0 впереди и сзади(границы массива)
            range = ((j - 1 >= 0 ? j - 1 : 0)..(j + 1 + k <= 9 ? j + 1 + k : 9))
            ships[k] += 1 if !field_m[i][range].include?(1) && !field_m[i+2][range].include?(1)
          end
        end
      }
    end
  end
  ships
end

def validate_battlefield(field)
  ships = [0, 0, 0, 0] # submarines destroyers cruisers battleships
  ships = ship_counter(field, 0, field.clone, ships)
  ships = ship_counter(field.transpose, 1, field.clone.transpose, ships)
  ships == [4, 3, 2, 1]
end
