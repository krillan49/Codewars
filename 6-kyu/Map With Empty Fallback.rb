#===============================================================================================================
#                                               Description
#===============================================================================================================

# Add a method to the Array class to map over itself with the given proc, but when the array is empty call the fallback proc. The method should return a new array when not empty.
#
# It's use should look like this:
#
# my_feelings = ["random", "stuff"]
# my_emptiness = []
#
# my_feelings.map_with_fallback ->(i) {
#   # map over my_feelings
# }, fallback: -> {
#   # run me when array is empty
# }
# # should return result of mapping over my_feelings with the first proc
#
# my_emptiness.map_with_fallback ->(i) {
#   # map over my_emptiness
# }, fallback: -> {
#   # run me when array is empty
# }
# # should return result of of the fallback proc
# Implement the Array#map_with_fallback method.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def map_with_fallback(*funcs)
    if self.empty?
      funcs[1] ? funcs[1][:fallback].call : nil
    else
      self.map{|e| funcs[0].call(e)}
    end
  end
end
