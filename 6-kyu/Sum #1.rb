#===============================================================================================================
#                                               Description
#===============================================================================================================

# PUZZLE #1. SUM
#
# Assignment:
#
# Write a function named sum which performs addition in the way shown below
#
# sum(4)(5)(9)(); // => 18
# sum(5)();       // => 5
# sum();          // => 0
# ```ruby sum(4).(5).(9).() #=> 18 sum(5).() #=> 5 sum() #=> 0
#
# NOTE: Pay attention that last brackets are left empty to indicate end of operations
#
# Thanks to @JohanWiltink, @donaldsebleung

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Fixnum
  def call(n=0)
    self + n
  end
end

def sum(n=0)
  n
end
