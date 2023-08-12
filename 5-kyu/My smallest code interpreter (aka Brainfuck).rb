#===============================================================================================================
#                                               Description
#===============================================================================================================

# Inspired from real-world Brainf**k, we want to create an interpreter of that language which will support the following instructions:
#
# > increment the data pointer (to point to the next cell to the right).
# < decrement the data pointer (to point to the next cell to the left).
# + increment (increase by one, truncate overflow: 255 + 1 = 0) the byte at the data pointer.
# - decrement (decrease by one, treat as unsigned byte: 0 - 1 = 255 ) the byte at the data pointer.
# . output the byte at the data pointer.
# , accept one byte of input, storing its value in the byte at the data pointer.
# [ if the byte at the data pointer is zero, then instead of moving the instruction pointer forward to the next command, jump it forward to the command after the matching ] command.
# ] if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it back to the command after the matching [ command.
# The function will take in input...
#
# the program code, a string with the sequence of machine instructions,
# the program input, a string, possibly empty, that will be interpreted as an array of bytes using each character's ASCII code and will be consumed by the , instruction
# ... and will return ...
#
# the output of the interpreted code (always as a string), produced by the . instruction.
# Implementation-specific details for this Kata:
#
# Your memory tape should be large enough - the original implementation had 30,000 cells but a few thousand should suffice for this Kata
# Each cell should hold an unsigned byte with wrapping behavior (i.e. 255 + 1 = 0, 0 - 1 = 255), initialized to 0
# The memory pointer should initially point to a cell in the tape with a sufficient number (e.g. a few thousand or more) of cells to its right. For convenience, you may want to have it point to the leftmost cell initially
# You may assume that the , command will never be invoked when the input stream is exhausted
# Error-handling, e.g. unmatched square brackets and/or memory pointer going past the leftmost cell is not required in this Kata. If you see test cases that require you to perform error-handling then please open an Issue in the Discourse for this Kata (don't forget to state which programming language you are attempting this Kata in)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class BrainFuckInterpreter
  attr_reader :output

  def initialize(code, input)
    @code = code
    @j = 0 # @code
    @input = input.chars.map(&:ord)
    @output = ''
    @cells = [0]
    @i = 0 # @cells
    @braket_ind = {}
  end

  def main
    braket_ind if @code.include?('[')
    bl_cycle
  end

  private

  def bl_cycle
    until @j >= @code.size
      e = @code[@j]
      k = 0
      if e == '>'
        @i += 1
        @cells[@i] = 0 if !@cells[@i]
      elsif e == '<'
        @i -= 1
      elsif e == '+'
        @cells[@i] = (@cells[@i] == 255 ? 0 : @cells[@i]+1)
      elsif e == '-'
        @cells[@i] = (@cells[@i] == 0 ? 255 : @cells[@i]-1)
      elsif e == '.'
        @output += @cells[@i].chr
      elsif e == ','
        @cells[@i] = (@input.empty? ? '' : @input.shift)
      elsif e == '[' && @cells[@i] == 0
        @j = @braket_ind[@j]
        k = 1
      elsif e == ']' && @cells[@i] != 0
        @j = @braket_ind.key(@j)
        k = 1
      end
      @j += 1 - k
    end
  end

  def braket_ind
    @code.each_char.with_index do |e, i|
      if e == '['
        point = 1
        @code[i+1..-1].each_char.with_index do |c, j|
          point += 1 if c == '['
          point -= 1 if c == ']'
          if point == 0
            @braket_ind[i] = j + i + 1
            break
          end
        end
      end
    end
  end
end

def brain_luck(code, input)
  brain_fuck=BrainFuckInterpreter.new(code, input)
  brain_fuck.main
  brain_fuck.output
end
