#===============================================================================================================
#                                               Description
#===============================================================================================================

# Smallfuck is an esoteric programming language/Esolang invented in 2002 which is a sized-down variant of the famous Brainfuck Esolang. Key differences include:
#
# Smallfuck operates only on bits as opposed to bytes
# It has a limited data storage which varies from implementation to implementation depending on the size of the tape
# It does not define input or output - the "input" is encoded in the initial state of the data storage (tape) and the "output" should be decoded in the final state of the data storage (tape)
# Here are a list of commands in Smallfuck:
#
# > - Move pointer to the right (by 1 cell)
# < - Move pointer to the left (by 1 cell)
# * - Flip the bit at the current cell
# [ - Jump past matching ] if value at current cell is 0
# ] - Jump back to matching [ (if value at current cell is nonzero)
# As opposed to Brainfuck where a program terminates only when all of the commands in the program have been considered (left to right), Smallfuck terminates when any of the two conditions mentioned below become true:
#
# All commands have been considered from left to right
# The pointer goes out-of-bounds (i.e. if it moves to the left of the first cell or to the right of the last cell of the tape)
# Smallfuck is considered to be Turing-complete if and only if it had a tape of infinite length; however, since the length of the tape is always defined as finite (as the interpreter cannot return a tape of infinite length), its computational class is of bounded-storage machines with bounded input.
#
# More information on this Esolang can be found here.
#
# The Task
# Implement a custom Smallfuck interpreter interpreter() (interpreter in Haskell and F#, Interpreter in C#, custom_small_fuck:interpreter/2 in Erlang) which accepts the following arguments:
#
# code - Required. The Smallfuck program to be executed, passed in as a string. May contain non-command characters. Your interpreter should simply ignore any non-command characters.
# tape - Required. The initial state of the data storage (tape), passed in as a string. For example, if the string "00101100" is passed in then it should translate to something of this form within your interpreter: [0, 0, 1, 0, 1, 1, 0, 0]. You may assume that all input strings for tape will be non-empty and will only contain "0"s and "1"s.
# Your interpreter should return the final state of the data storage (tape) as a string in the same format that it was passed in. For example, if the tape in your interpreter ends up being [1, 1, 1, 1, 1] then return the string "11111".
#
# NOTE: The pointer of the interpreter always starts from the first (leftmost) cell of the tape, same as in Brainfuck.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class SmallFuckInterpreter
  attr_reader :input

  def initialize(code, input)
    @code, @input = code.gsub(/[^*><+\[\]]/, ''), input.chars.map(&:to_i)
    @j, @i = 0, 0 # @code[@j], @input[@i]
    @braket_ind = {}
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
      if e == '>'
        @i += 1
        break if @i >= @input.size
      elsif e == '<'
        @i -= 1
        break if @i < 0
      elsif e == '*'
        @input[@i] = (@input[@i] - 1).abs
      elsif e == '[' && @input[@i] == 0
        @j = @braket_ind[@j]
        k = 1
      elsif e==']' && @input[@i] != 0
        @j = @braket_ind.key(@j)
        k = 1
      end
      @j += 1-k
    end
  end

  def braket_ind
    @code.each_char.with_index{|e, i|
      if e == '['
        point = 1
        @code[i+1..-1].each_char.with_index{|c, j|
          point += 1 if c == '['
          point -= 1 if c == ']'
          if point == 0
            @braket_ind[i] = j + i + 1
            break
          end
        }
      end
    }
  end
end

def interpreter(code, input)
  small_fuck = SmallFuckInterpreter.new(code, input)
  small_fuck.main
  small_fuck.input.join
end
