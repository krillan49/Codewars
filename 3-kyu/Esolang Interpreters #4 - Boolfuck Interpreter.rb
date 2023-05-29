#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Language
# Boolfuck is an esoteric programming language (Esolang) based on the famous Brainfuck (also an Esolang) which was invented in 2004 or 2005 according to the official website. It is very similar to Brainfuck except for a few key differences:
#
# Boolfuck works with bits as opposed to bytes
# The tape for Brainfuck contains exactly 30,000 cells with the pointer starting from the very left; Boolfuck contains an infinitely long tape with the pointer starting at the "middle" (since the tape can be extended indefinitely either direction)
# Each cell in Boolfuck can only contain the values 0 or 1 (i.e. bits not bytes) as opposed to Brainfuck which has cells containing values ranging from 0 to 255 inclusive.
# The output command in Boolfuck is ; NOT .
# The - command does not exist in Boolfuck since either + or - would flip a bit anyway
# Anyway, here is a list of commands and their descriptions:
#
# + - Flips the value of the bit under the pointer
# , - Reads a bit from the input stream, storing it under the pointer. The end-user types information using characters, though. Bytes are read in little-endian order—the first bit read from the character a, for instance, is 1, followed by 0, 0, 0, 0, 1, 1, and finally 0. If the end-of-file has been reached, outputs a zero to the bit under the pointer.
# ; - Outputs the bit under the pointer to the output stream. The bits get output in little-endian order, the same order in which they would be input. If the total number of bits output is not a multiple of eight at the end of the program, the last character of output gets padded with zeros on the more significant end.
# < - Moves the pointer left by 1 bit
# > - Moves the pointer right by 1 bit
# [ - If the value under the pointer is 0 then skip to the corresponding ]
# ] - Jumps back to the matching [ character, if the value under the pointer is 1
# If you haven't written an interpreter for Brainfuck yet I recommend you to complete this Kata first.
#
# The Task
# Write a Boolfuck interpreter which accepts up to two arguments. The first (required) argument is the Boolfuck code in the form of a string. The second (optional) argument is the input passed in by the end-user (i.e. as actual characters not bits) which should default to "" if not provided. Your interpreter should return the output as actual characters (not bits!) as a string.
#
# function boolfuck (code, input = "")
# Preloaded for you is a function brainfuckToBoolfuck()/brainfuck_to_boolfuck()/BrainfuckToBoolfuck() which accepts 1 required argument (the Brainfuck code) and returns its Boolfuck equivalent should you find it useful.
#
# Please note that your interpreter should simply ignore any non-command characters. This will be tested in the test cases.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class BoolFuckInterpreter
  attr_reader :output

  def initialize(code, input)
    @code, @input = code, input
    @j = 0 # индекс в строке ввода кода брэйнфак
    @output = []
    @cells = {0=>0} # хэш ячеек
    @i = 0 # индекс активной ячейки
    @braket_ind = {} # индексы открытия и закрытия скобок циклов
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
        @cells[@i] = 0 if !@cells[@i]
      elsif e == '+'
        @cells[@i] = (@cells[@i] - 1).abs
      elsif e == ';'
        @output << @cells[@i]
      elsif e == ','
        @cells[@i] = (@input.empty? ? 0 : @input.shift)
      elsif e == '[' && @cells[@i] == 0
        @j = @braket_ind[@j]
        k = 1
      elsif e == ']' && @cells[@i] == 1
        @j = @braket_ind.key(@j)
        k = 1
      end
      @j = @j + 1 - k
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

def boolfuck(code, input='')
  code = code.gsub(/[^+,;><\[\]]/, '').chars
  input = input.chars.map{|c| c.ord.to_s(2)}.map{|b| ('0' * (8 - b.size) + b).reverse}.join.chars.map(&:to_i)
  boolfuck = BoolFuckInterpreter.new(code, input)
  boolfuck.main
  res = boolfuck.output
  res = res + [0] * ((res.size / 8 + 1) * 8 - res.size) if res.size % 8 != 0
  res.each_slice(8).map{|a| a.reverse.join.to_i(2).chr}.join
end
