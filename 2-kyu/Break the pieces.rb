#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a ASCII diagram, comprised of minus signs -, plus signs +, vertical bars | and whitespaces   . Your task is to write a function which breaks the diagram in the minimal pieces it is made of.
#
# For example, if the input for your function is this diagram:
#
# +------------+
# |            |
# |            |
# |            |
# +------+-----+
# |      |     |
# |      |     |
# +------+-----+
# the returned value should be the list of:
#
# +------------+
# |            |
# |            |
# |            |
# +------------+
# (note how it lost a + sign in the extraction)
#
# as well as
#
# +------+
# |      |
# |      |
# +------+
# and
#
# +-----+
# |     |
# |     |
# +-----+
# The diagram is given as an ordinary multiline string. There are no borders touching each others.
#
# The pieces should not have trailing spaces at the end of the lines. However, it could have leading spaces if the figure is not a rectangle. For instance:
#
#     +---+
#     |   |
# +---+   |
# |       |
# +-------+
# However, it is not allowed to use more leading spaces than necessary. It is to say, the first character of some of the lines should be different than a space.
#
# Finally, note that only the explicitly closed pieces are considered. Spaces "outside" of the shape are part of the background . Therefore the diagram above has a single piece.
#
# Have fun!
#
# Note : in C++ you are provided with two utility functions :
#
# std::string join(const std::string &sep, const std::vector<std::string> &to_join); // Returns the concatenation of all the strings in the vector, separated with sep
#
# std::vector<std::string> split_lines(const std::string &to_split); // Splits a string, using separator '\n'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Breaker
  def initialize(shape)
    @ceils_check = shape.split("\n").map.with_index{|a, y| a.split('').map.with_index{|e, x| [[y, x], e]}}.flatten(1).to_h
    @ceils = shape.split("\n").map.with_index{|a, y| a.split('').map.with_index{|e, x| [[y, x], e]}}.flatten(1).to_h
    @y, @x, @my, @mx = nil, nil, @ceils.keys.max_by(&:first)[0], @ceils.keys.max_by(&:last)[1]

    @dir = :U  # starting direction, as you need to go right at the starting '+'
    @rdlu = {R: %i[D R U], D: %i[L D R], L: %i[U L D], U: %i[R U L]} # next direction
    @dk = {R: {y: 0, x: 1}, D: {y: 1, x: 0}, L: {y: 0, x: -1}, U: {y: -1, x: 0}} # coordinate modifiers in the next direction

    @piece_border = []
    @pieces = []
  end

  def main
    until @ceils.values.all?{|e| e == ' '}
      find_start_cross
      find_piece
      break_piece
      @pieces << [*@piece_border] # we only get strokes
      @piece_border = []
    end
    make_pieces
  end

  def find_start_cross
    (0..@my).find{|i| (0..@mx).find{|j| @y, @x = i, j if @ceils[[i, j]] == '+'} }
  end

  def find_piece
    @piece_border << [@y, @x] # point of starting '+'
    until @piece_border.size >= 4 && @piece_border[0] == @piece_border[-1]
      if @ceils[[@y, @x]] == '+'
        @dir = @rdlu.find{|k, _| k == @dir}[1].find{|d| ['-', '|'].include?(@ceils[[@y + @dk[d][:y], @x + @dk[d][:x]]]) }
      end
      @y += @dk[@dir][:y]
      @x += @dk[@dir][:x]
      @piece_border << [@y, @x]
    end
    @piece_border = @piece_border[0..-2]
    @dir = :U
  end

  def break_piece
    @delete_border = []
    @delete = true
    @piece_border.each do |y, x| # search right
      if @ceils[[y, x]] == '+'
        count = [[y+1, x], [y-1, x], [y, x+1], [y, x-1]].count{|i, j| @ceils[[i, j]] && ['-', '|'].include?(@ceils[[i, j]])}
        @delete = count < 3 && @delete ? true : false # enable deletion if there are less than 3 directions and deletion is enabled
      end
      @delete_border << [y, x] if @delete
    end
    @delete = true
    @piece_border.reverse.each.with_index do |(y, x), i| # search down
      if @ceils[[y, x]] == '+' || i == 0
        count = [[y+1, x], [y-1, x], [y, x+1], [y, x-1]].count{|i, j| @ceils[[i, j]] && ['-', '|'].include?(@ceils[[i, j]])}
        @delete = count < 3 && @delete ? true : false
      end
      @delete_border << [y, x] if @delete
    end
    @delete_border.uniq.each{|y, x| @ceils[[y, x]] = ' '} # replacing '+' '|' '-' on ' '
  end

  def make_pieces # create pieces using strokes
    @pieces.map do |piece|
      arr = []
      piece.map do |y, x|
        arr[y] = [] if !arr[y]
        arr[y][x] = @ceils_check[[y, x]]
      end
      arr = arr.compact.map{|a| a.map{|e| e ? e : ' '}}
      im, jm = arr[0].size-1, 0 # min and max x-index where the closest and farthest element is located
      arr.each do |a|
        i, j = a.index{|e| e != ' '}, a.rindex{|e| e != ' '}
        im = i if i < im
        jm = j if j > jm
      end
      arr = arr.map{|a| a[im..jm]} # cut off the excess on the right and left
      arr = delete_pluses_in_lines(arr)
      arr.map(&:join).join("\n")
    end
  end

  private

  def delete_pluses_in_lines(arr)
    arr.map.with_index do |a, i|
      a.map.with_index do |el, j|
        if el == '+'
          a = i+1 < arr.size ? arr[i+1][j] : nil
          b = i-1 >= 0 ? arr[i-1][j] : nil
          els = [a, b, arr[i][j+1], arr[i][j-1]].select{|e| e && e != ' '} # there are identical elements on both sides of the '+'
          el = els[0] if els.uniq.size == 1
        end
        el
      end
    end
  end
end

def break_pieces(shape)
  Breaker.new(shape).main
end
