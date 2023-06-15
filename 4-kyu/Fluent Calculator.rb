#===============================================================================================================
#                                               Description
#===============================================================================================================

# The goal is to implement simple calculator which uses fluent syntax:
#
# Calc.new.one.plus.two             # Should return 3
# Calc.new.five.minus.six           # Should return -1
# Calc.new.seven.times.two          # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3
# There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).
#
# Each calculation consists of one operation only.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Calc
  NUMS = {zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9}
  ACTIONS = {plus: '+', minus: '-', times: '*', divided_by: '/'}

  def method_missing(method)
    if !@value
      @value = NUMS[method]
      return self
    end
    if !@operation
      @operation = method
      return self
    end
    @value.send(ACTIONS[@operation], NUMS[method])
  end
end
