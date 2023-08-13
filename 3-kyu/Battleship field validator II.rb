#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a method that takes a field for well-known board game "Battleship" as an argument and returns true if it has a valid disposition of ships, false otherwise. Argument is guaranteed to be 10*10 two-dimension array. Elements in the array are numbers, 0 if the cell is free and 1 if occupied by ship.
#
# Battleship (also Battleships or Sea Battle) is a guessing game for two players. Each player has a 10x10 grid containing several "ships" and objective is to destroy enemy's forces by targetting individual cells on his field. The ship occupies one or more cells in the grid. Size and number of ships may differ from version to version. In this kata we will use Soviet/Russian version of the game.
#
# Before the game begins, players set up the board and place the ships accordingly to the following rules:
#
# There must be single battleship (size of 4 cells), 2 cruisers (size 3), 3 destroyers (size 2) and 4 submarines (size 1). Any additional ships are not allowed, as well as missing ships.
# Each ship must be a straight line, except for submarines, which are just single cell.
# The ship cannot overlap, but can be contact with any other ship.
# The description likes Battleship field validator Kata, the only difference is the rule 3.
#
# This is all you need to solve this kata. If you're interested in more information about the game, visit this link.
# https://en.wikipedia.org/wiki/Battleship_(game)

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# The selection of ships starting from the largest using the backtracking method works

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Battlefield
  attr_reader :validate, :field

  def initialize(field)
    @field = field
    @validate = false
  end

  def ships_checker(n=4)
    if n == 1
      submarines = ships_finder(1).flatten(1).uniq
      @validate = true if submarines.size == 4
    else
      shipsNs = ships_finder(n).combination(5-n).select{|comb| comb.flatten(1).uniq == comb.flatten(1)}
      shipsNs.each do |ships|
        ships.flatten(1).each{|i, j| @field[i][j] = n}
        ships_checker(n-1)
        break if @validate
        ships.flatten(1).each{|i, j| @field[i][j] = 1}
      end
    end
  end

  private

  def ships_finder(n)
    ships = []
    [@field, @field.transpose].each.with_index do |field, k|
      field.each.with_index do |a, i|
        ship = []
        a.each.with_index do |e, j|
          ship << (k == 0 ? [i, j] : [j, i]) if e == 1
          if e != 1 || j == a.size-1
            ships << ship if ship.size >= n
            ship = []
          end
        end
      end
    end
    ships.map{|arr| arr.each_cons(n).to_a}.flatten(1)
  end
end

def validate_battlefield(field)
  b = Battlefield.new(field)
  b.ships_checker
  b.validate
end
