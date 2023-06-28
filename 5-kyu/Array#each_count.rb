#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a method, Array#each_count, which returns a count of discrete elements contained in the form of {element => count}.
#
# Your method should meet the following criteria:
#
# When called without arguments or a block, it should iterate over each element of self, returning a count of its unique elements.
#
# It should accept a method (in symbol or string format) followed by any number of arguments as parameters. It should apply these parameters to each element of self, returning a count of each unique return value.
#
# It should accept a block, call the block on each element of self, and return a count of each unique return value.
#
# It should raise an exception if both arguments and a block are provided.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def each_count(*args, &block)
    raise ArgsBlockSametime if args != [] && block
    if block
      self.map{|e| block.call(e)}.tally
    elsif args != []
      args[0] = args[0].to_sym
      self.map{|e| e.send(*args)}.tally
    else
      self.tally
    end
  end
end
