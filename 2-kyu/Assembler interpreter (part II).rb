#===============================================================================================================
#                                               Description
#===============================================================================================================

# This is the second part of this kata series. First part is here.
#
# We want to create an interpreter of assembler which will support the following instructions:
#
# mov x, y - copy y (either an integer or the value of a register) into register x.
# inc x - increase the content of register x by one.
# dec x - decrease the content of register x by one.
# add x, y - add the content of the register x with y (either an integer or the value of a register) and stores the result in x (i.e. register[x] += y).
# sub x, y - subtract y (either an integer or the value of a register) from the register x and stores the result in x (i.e. register[x] -= y).
# mul x, y - same with multiply (i.e. register[x] *= y).
# div x, y - same with integer division (i.e. register[x] /= y).
# label: - define a label position (label = identifier + ":", an identifier being a string that does not match any other command). Jump commands and call are aimed to these labels positions in the program.
# jmp lbl - jumps to the label lbl.
# cmp x, y - compares x (either an integer or the value of a register) and y (either an integer or the value of a register). The result is used in the conditional jumps (jne, je, jge, jg, jle and jl)
# jne lbl - jump to the label lbl if the values of the previous cmp command were not equal.
# je lbl - jump to the label lbl if the values of the previous cmp command were equal.
# jge lbl - jump to the label lbl if x was greater or equal than y in the previous cmp command.
# jg lbl - jump to the label lbl if x was greater than y in the previous cmp command.
# jle lbl - jump to the label lbl if x was less or equal than y in the previous cmp command.
# jl lbl - jump to the label lbl if x was less than y in the previous cmp command.
# call lbl - call to the subroutine identified by lbl. When a ret is found in a subroutine, the instruction pointer should return to the instruction next to this call command.
# ret - when a ret is found in a subroutine, the instruction pointer should return to the instruction that called the current function.
# msg 'Register: ', x - this instruction stores the output of the program. It may contain text strings (delimited by single quotes) and registers. The number of arguments isn't limited and will vary, depending on the program.
# end - this instruction indicates that the program ends correctly, so the stored output is returned (if the program terminates without this instruction it should return the default output: see below).
# ; comment - comments should not be taken in consideration during the execution of the program.
#
# Output format:
# The normal output format is a string (returned with the end command). For Scala and Rust programming languages it should be incapsulated into Option.
#
# If the program does finish itself without using an end instruction, the default return value is:
#
# -1 (as an integer)
#
# Input format:
# The function/method will take as input a multiline string of instructions, delimited with EOL characters. Please, note that the instructions may also have indentation for readability purposes.
#
# For example:
#
# program = "
# ; My first program
# mov  a, 5
# inc  a
# call function
# msg  '(5+1)/2 = ', a    ; output message
# end
#
# function:
#     div  a, 2
#     ret
# "
# assembler_interpreter(program)
# The above code would set register a to 5, increase its value by 1, calls the subroutine function, divide its value by 2, returns to the first call instruction, prepares the output of the program and then returns it with the end instruction. In this case, the output would be (5+1)/2 = 3.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. The example in the description does not display the input string correctly (removes some spaces), so do not use it

# 2. 'ret' returns to the last line of the 'call', but not to the 'jump'

# 3. If there is no 'rat' in the last line of the function, then move further through the program, for example to the next function in order. A detailed description with an example can be read here:
# https://www.codewars.com/kata/58e61f3d8ff24f774400002c/discuss/python#5c35e71101883f5597eb533d

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class AssemblerInterpreter
  def initialize(string)
    @functions = {}
    @next_function = 'main'
    @calls = []
    @vars = {}
    parser(string)
    @functions_list = @functions.to_a
  end

  def main
    res = nil
    loop do
      return @res if res == 'end'
      return -1 if res == 'exit'
      if res == 'ret'
        function_from = @calls.pop
        i = @functions[function_from].index{|func| func == ["call", @call_function]} + 1
        @next_function = function_from
        res = next_function_start(i)
      else
        res = next_function_start(0)
      end
    end
  end

  def next_function_start(i)
    if @functions[@next_function][i..-1] == []
      i = @functions_list.index{|func| func[0] == @next_function}
      if i + 1 < @functions_list.size
        @next_function = @functions_list[i+i][0]
        return 'next'
      else
        return 'exit'
      end
    end
    @functions[@next_function][i..-1].each do |com|
      if com[0] == 'end' || com[0] == 'ret'
        return com[0]
      elsif com[0] == 'call'
        @calls << @next_function
        @next_function = @call_function = com[1]
        return 'next'
      elsif %w[jmp jne je jge jg jle jl].include?(com[0]) && send(*com)
        @next_function = com[1]
        return 'next'
      else
        send(*com)
      end
    end
    'exit'
  end

  private

  # Assembler commands helper
  def num_or_var(arg)
    arg.class.superclass == Numeric ? arg : @vars[arg]
  end

  # Assembler commands(except: call, ret, end):
  def mov(arg) @vars[arg[0]] = num_or_var(arg[1]) end

  def inc(arg) @vars[arg[0].to_sym] += 1 end
  def dec(arg) @vars[arg[0].to_sym] -= 1 end

  def add(arg) @vars[arg[0]] += num_or_var(arg[1]) end
  def sub(arg) @vars[arg[0]] -= num_or_var(arg[1]) end
  def mul(arg) @vars[arg[0]] *= num_or_var(arg[1]) end
  def div(arg) @vars[arg[0]] /= num_or_var(arg[1]) end

  def jmp(arg) true end
  def cmp(arg)
    @cmp = num_or_var(arg[0]) <=> num_or_var(arg[1])
  end
  def jne(arg) @cmp != 0 end
  def je(arg) @cmp == 0 end
  def jge(arg) @cmp >= 0 end
  def jg(arg) @cmp == 1 end
  def jle(arg) @cmp <= 0 end
  def jl(arg) @cmp == -1 end

  def msg(arg)
    @res = arg.map{|e| @vars[e] ? @vars[e] : e}.join
  end

  # Parsers
  def parser(string)
    prog = string.gsub(/(;.+)(\n)/, '\2')
                 .gsub(/\n */, "\n")
                 .strip
                 .split("\n\n")
                 .map{|pr| pr.split("\n").reject(&:empty?).map(&:strip)}
    @functions['main'] = command_split_arg(prog[0])
    @functions.merge! prog[1..-1].map{|f| [f[0][0..-2], command_split_arg(f[1..-1])]}.to_h
  end

  def command_split_arg(com_arg)
    com_arg.map do |com|
      name, arg = com.split[0], com.split[1..-1].join(' ')
      arg = duble_arg_parser(arg) if %w[mov add sub mul div cmp].include?(name)
      arg = msg_parser(arg) if name == 'msg'
      [name, arg].reject(&:empty?)
    end
  end

  def duble_arg_parser(arg)
    arg.split(', ').map{|e| /[0-9]+/ === e ? e.to_i : e.to_sym}
  end

  def msg_parser(arg)
    j = arg[0] == "'" ? 0 : 1
    arg.split("'").reject(&:empty?).map.with_index{|e, i| (i + j).even? ? e : e.tr('^a-z', '').to_sym}
  end
end

def assembler_interpreter(program)
  ai = AssemblerInterpreter.new(program)
  ai.main rescue -1
end
