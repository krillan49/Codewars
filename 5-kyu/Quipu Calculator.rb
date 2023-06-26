#===============================================================================================================
#                                               Description
#===============================================================================================================

# Quipu Calculator
#
# The Quipu is the numbering system of the ancient Incas. A number is represented by knots in a string, using a positional representation (in base-10).
#
# The representation of 123: one knot + space + two knots + space + three knots
#
# Zeros are represented using a blank space. (leading zeros are not allowed)
#
# @ is a knot and ~ is a space.
#
# 123 => @~@@~@@@
# 20 => @@~~
# Create a method that calculates mathematical expressions in quipu format.
#
# Input
#
# A string representing a mathematical expression with operands in the quipu format above, separated by the plus [+] or minus [-] or division [/] or multiplication [*] sign.
#
# *Hint1: The expression can also include parenthesis to change order of operation.
#
# *Hint2: Between two 0-s you have to put a space, but between a 0 and 1 for example you haven't.
#
# @~@ => 11
# @~~@ => 101
# @~~~@ => 1001
# @ ~     ~ ~     ~ @ => 1001 (!!)
# 1 space 0 space 0 1
# Output
#
# A string representing the result of the mathematical expression in quipu format.
#
# Example:
#
# calculate("@~@@*@@")
# => "@@~@@@@"
# calculate("@~@@+@@~~")
# => "@@@~@@"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def operation(arr, op1, op2)
  while arr.any?{|e| e == [op1] or e == [op2]}
    arr.each.with_index do |n, i|
      if n == [op1] or n == [op2]
        arr[i] = arr[i-1].send(n[0], arr[i+1])
        arr[i-1], arr[i+1] = nil, nil
        break
      end
    end
    arr = arr.compact
  end
  arr
end

def operations(arr)
  operation(operation(arr, '*', '/'), '+', '-')
end

def to_quipu(arr)
  arr = arr.join.chars.map(&:to_i)
  arr.map.with_index{|n,i| (n > 0 && i == arr.size - 1) ? '@' * n : n > 0 ? '@' * n + '~' : '~'}.join
end

def from_quipu(arr)
  arr.slice_when{|a, b| (a == '@' && b == '~') or (a == '~' && b == '@')}
  .map{|a| a.include?('~') ? '0' * (a.size - 1) : a.size}.join.to_i
end

def calculate(quipu)
  exp = quipu.chars.chunk_while{|a,b| /[@~]/ === a && /[@~]/ === b}.map{|a| a.any?{|e| /[@~]/ === e} ? from_quipu(a) : a}
  if exp.include?([')'])
    is, ie = exp.index(['(']), exp.index([')'])
    exp = exp[0...is] + operations(exp[is + 1, ie - 1]) + exp[ie+1..-1]
  end
  to_quipu(operations(exp))
end
