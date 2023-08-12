#===============================================================================================================
#                                               Description
#===============================================================================================================

# This is the first part of this kata series. Second part is here.
#
# We want to create a simple interpreter of assembler which will support the following instructions:
#
# mov x y - copies y (either a constant value or the content of a register) into register x
# inc x - increases the content of the register x by one
# dec x - decreases the content of the register x by one
# jnz x y - jumps to an instruction y steps away (positive means forward, negative means backward, y can be a register or a constant), but only if x (a constant or a register) is not zero
# Register names are alphabetical (letters only). Constants are always integers (positive or negative).
#
# Note: the jnz instruction moves relative to itself. For example, an offset of -1 would continue at the previous instruction, while an offset of 2 would skip over the next instruction.
#
# The function will take an input list with the sequence of the program instructions and will execute them. The program ends when there are no more instructions to execute, then it returns a dictionary (a table in COBOL) with the contents of the registers.
#
# Also, every inc/dec/jnz on a register will always be preceeded by a mov on the register first, so you don't need to worry about uninitialized registers.
#
# Example
# ["mov a 5"; "inc a"; "dec a"; "dec a"; "jnz a -1"; "inc a"]
#
# visualized:
#
# mov a 5
# inc a
# dec a
# dec a
# jnz a -1
# inc a
# The above code will:
#
# set register a to 5,
# increase its value by 1,
# decrease its value by 2,
# then decrease its value until it is zero (jnz a -1 jumps to the previous instruction if a is not zero)
# and then increase its value by 1, leaving register a at 1
# So, the function should return:
#
# Map("a"->1)
# This kata is based on the Advent of Code 2016 - day 12

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class SimpleAssemblerInterpreter
  attr_reader :res

  def initialize(program)
    @program = program.map{|e| e.split.map{|el| /[0-9-]/ === el[0] ? el.to_i : el}}
    @program[-1] << true
    @res = {}
    @i = 0
  end

  def list_iterator
    loop do
      @program.each.with_index do |a, i|
        if i >= @i
          if a[0] == 'mov'
            @res[a[1]] = a[2].class == Integer ? a[2] : @res[a[2]]
          elsif a[0] == 'inc'
            @res[a[1]] += 1
          elsif a[0] == 'dec'
            @res[a[1]] -= 1
          elsif a[0] == 'jnz'
            steps = a[2].class == Integer ? a[2] : @res[a[2]]
            if @res[a[1]] != 0
              @i = i + steps
              break
            end
          end
        end
        return @res if a[-1] == true
      end
    end
  end
end

def simple_assembler(program)
  sai = SimpleAssemblerInterpreter.new(program)
  sai.list_iterator
  sai.res
end
