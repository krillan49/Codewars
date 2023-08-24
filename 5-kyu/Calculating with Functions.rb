#===============================================================================================================
#                                               Description
#===============================================================================================================

# This time we want to write calculations using functions and get the results. Let's have a look at some examples:
#
# seven(times(five)) # must return 35
# four(plus(nine)) # must return 13
# eight(minus(three)) # must return 5
# six(divided_by(two)) # must return 3
# Requirements:
#
# There must be a function for each number from 0 ("zero") to 9 ("nine")
# There must be a function for each of the following mathematical operations: plus, minus, times, divided_by
# Each calculation consist of exactly one operation and two numbers
# The most outer function represents the left operand, the most inner function represents the right operand
# Division should be integer division. For example, this should return 2, not 2.666666...:
# eight(divided_by(three))

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def zero(b=nil)
  b ? b.call(0) : 0
end
def one(b=nil)
  b ? b.call(1) : 1
end
def two(b=nil)
  b ? b.call(2) : 2
end
def three(b=nil)
  b ? b.call(3) : 3
end
def four(b=nil)
  b ? b.call(4) : 4
end
def five(b=nil)
  b ? b.call(5) : 5
end
def six(b=nil)
  b ? b.call(6) : 6
end
def seven(b=nil)
  b ? b.call(7) : 7
end
def eight(b=nil)
  b ? b.call(8) : 8
end
def nine(b=nil)
  b ? b.call(9) : 9
end
def plus(n)
  lambda {|x| x + n}
end
def minus(n)
  lambda {|x| x - n}
end
def times(n)
  lambda {|x| x * n}
end
def divided_by(n)
  lambda {|x| x / n}
end
