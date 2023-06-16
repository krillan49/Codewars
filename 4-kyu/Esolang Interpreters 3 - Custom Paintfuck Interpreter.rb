#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Language
# Paintfuck is a borderline-esoteric programming language/Esolang which is a derivative of Smallfuck (itself a derivative of the famous Brainfuck) that uses a two-dimensional data grid instead of a one-dimensional tape.
#
# Valid commands in Paintfuck include:
#
# n - Move data pointer north (up)
# e - Move data pointer east (right)
# s - Move data pointer south (down)
# w - Move data pointer west (left)
# * - Flip the bit at the current cell (same as in Smallfuck)
# [ - Jump past matching ] if bit under current pointer is 0 (same as in Smallfuck)
# ] - Jump back to the matching [ (if bit under current pointer is nonzero) (same as in Smallfuck)
# The specification states that any non-command character (i.e. any character other than those mentioned above) should simply be ignored. The output of the interpreter is the two-dimensional data grid itself, best as animation as the interpreter is running, but at least a representation of the data grid itself after a certain number of iterations (explained later in task).
#
# In current implementations, the 2D datagrid is finite in size with toroidal (wrapping) behaviour. This is one of the few major differences of Paintfuck from Smallfuck as Smallfuck terminates (normally) whenever the pointer exceeds the bounds of the tape.
#
# Similar to Smallfuck, Paintfuck is Turing-complete if and only if the 2D data grid/canvas were unlimited in size. However, since the size of the data grid is defined to be finite, it acts like a finite state machine.
#
# More info on this Esolang can be found here.
#
# The Task
# Your task is to implement a custom Paintfuck interpreter interpreter()/Interpret which accepts the following arguments in the specified order:
#
# code - Required. The Paintfuck code to be executed, passed in as a string. May contain comments (non-command characters), in which case your interpreter should simply ignore them. If empty, simply return the initial state of the data grid.
# iterations - Required. A non-negative integer specifying the number of iterations to be performed before the final state of the data grid is returned. See notes for definition of 1 iteration. If equal to zero, simply return the initial state of the data grid.
# width - Required. The width of the data grid in terms of the number of data cells in each row, passed in as a positive integer.
# height - Required. The height of the data grid in cells (i.e. number of rows) passed in as a positive integer.
# A few things to note:
#
# Your interpreter should treat all command characters as case-sensitive so N, E, S and W are not valid command characters
# Your interpreter should initialize all cells within the data grid to a value of 0 regardless of the width and height of the grid
# In this implementation, your pointer must always start at the top-left hand corner of the data grid (i.e. first row, first column). This is important as some implementations have the data pointer starting at the middle of the grid.
# One iteration is defined as one step in the program, i.e. the number of command characters evaluated. For example, given a program nessewnnnewwwsswse and an iteration count of 5, your interpreter should evaluate nesse before returning the final state of the data grid. Non-command characters should not count towards the number of iterations.
# Regarding iterations, the act of skipping to the matching ] when a [ is encountered (or vice versa) is considered to be one iteration regardless of the number of command characters in between. The next iteration then commences at the command right after the matching ] (or [).
# Your interpreter should terminate normally and return the final state of the 2D data grid whenever any of the mentioned conditions become true: (1) All commands have been considered left to right, or (2) Your interpreter has already performed the number of iterations specified in the second argument.
# The return value of your interpreter should be a representation of the final state of the 2D data grid where each row is separated from the next by a CRLF (\r\n). For example, if the final state of your datagrid is
# [
#   [1, 0, 0],
#   [0, 1, 0],
#   [0, 0, 1]
# ]
# ... then your return string should be "100\r\n010\r\n001".

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class PaintFuckInterpreter
  attr_reader :input

  def initialize(code, input, iterations)
    @code, @input, @iterations = code.chars, input, iterations
    @y, @x=0, 0 # индексы в сетке ввода значений(@input)
    @j = 0 # индекс в строке ввода кода SmallFuck(@code)
    @braket_ind = {} # индексы открытия и закрытия скобок циклов
  end

  def main
    braket_ind if @code.include?('[')
    sm_cycle
  end

  private

  def sm_cycle
    until @j >= @code.size
      e = @code[@j]
      k = 0
      if e == 'n'
        @y = (@y - 1 < 0 ? @input.size - 1 : @y - 1)
      elsif e == 's'
        @y = (@y + 1 > @input.size - 1 ? 0 : @y + 1)
      elsif e == 'w'
        @x = (@x - 1 < 0 ? @input[0].size - 1 : @x - 1)
      elsif e == 'e'
        @x = (@x + 1 > @input[0].size - 1 ? 0 : @x + 1)
      elsif e == '*'
        @input[@y][@x] = (@input[@y][@x] - 1).abs
      elsif e == '[' && @input[@y][@x] == 0
        @j = @braket_ind[@j]
        k = 1
        @iterations += 1
      elsif e==']' && @input[@y][@x] != 0
        @j = @braket_ind.key(@j)
        k = 1
        @iterations += 1
      end
      @j = @j + 1 - k
      @iterations -= 1
      break if @iterations == 0
    end
  end

  def braket_ind
    @code.each.with_index { |e,i|
      if e == '['
        point = 1
        @code[i+1..-1].each.with_index { |c,j|
          if c == '['
            point += 1
          elsif c == ']'
            point -= 1
          end
          if point == 0
            @braket_ind[i] = j + i + 1
            break
          end
        }
      end
    }
  end

end

def interpreter(code0, iterations, width, height)
  code = code0.gsub(/[^*nesw\[\]]/, '')
  input = Array.new(height){Array.new(width, 0)}
  return input.map(&:join).join("\r\n") if code == '' or iterations == 0
  paint_fuck = PaintFuckInterpreter.new(code, input, iterations)
  paint_fuck.main
  paint_fuck.input.map(&:join).join("\r\n")
end
