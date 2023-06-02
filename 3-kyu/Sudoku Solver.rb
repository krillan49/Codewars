#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a function that will solve a 9x9 Sudoku puzzle. The function will take one argument consisting of the 2D puzzle array, with the value 0 representing an unknown square.
#
# The Sudokus tested against your function will be "easy" (i.e. determinable; there will be no need to assume and test possibilities on unknowns) and can be solved with a brute-force approach

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# brute force with exception checking for each cell and then padding - works

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class SudokuSolver
  attr_reader :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
    @grid = puzzle.map.with_index{|arr,i| arr.map.with_index{|e,j| [[i,j],e == 0 ? [] : e]}}.flatten(1).to_h
  end

  def solve
    [:rows_except, :cols_except, :sqrs_except, :cell_filling].cycle do |meth|
      send meth
      break if @puzzle.flatten.sum == 405
    end
  end

  private

  def rows_except # add the values of the filled cells to the empty exceptions ([]) in each line
    (0..8).each do |i|
      val = @grid.select{|k, v| k[0] == i && v.class != Array}.values  # the values of filled cells in each line
      @grid.select{|k, v| k[0] == i && v.class == Array}.each{|k,v| @grid[k] = (@grid[k]+val).uniq}
    end
  end

  def cols_except
    (0..8).each do |j|
      val = @grid.select{|k, v| k[1] == j && v.class != Array}.values # filled cell values in each column
      @grid.select{|k, v| k[1] == j && v.class == Array}.each{|k,v| @grid[k] = (@grid[k]+val).uniq}
    end
  end

  def sqrs_except
    [0..2, 3..5, 6..8].each do |r_i|
      [0..2, 3..5, 6..8].each do |r_j|
        val = @grid.select{|k, v| r_i.include?(k[0]) && r_j.include?(k[1]) && v.class != Array}.values
        @grid.select{|k, v| r_i.include?(k[0]) && r_j.include?(k[1]) && v.class == Array}.each{|k,v| @grid[k] = (@grid[k]+val).uniq}
      end
    end
  end

  def cell_filling
    @grid.each do |(i, j),v|
      if v.class == Array && v.size == 8
        v = ((1..9).to_a - v)[0]
        @grid[[i, j]] = v
        @puzzle[i][j] = v
      end
    end
  end
end

def sudoku(puzzle)
  solver = SudokuSolver.new(puzzle)
  solver.solve
  solver.puzzle
end
