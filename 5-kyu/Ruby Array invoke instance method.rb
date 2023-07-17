#===============================================================================================================
#                                               Description
#===============================================================================================================

# Extend the Array class so that it supports an "invoke" instance method. The method will be called when someone wishes to execute/invoke a method on each of the items in the array.
#
# This method will be a more advanced alternative to using the each/to_proc shorthand:
#
# array_items.each(&:method_to_call)
# The invoke method signature will take a method name, any number of arguments to be passed to the invoked method and optionally a block that will be used to determine if the method should be called for a particular item or not. The method will return an array containing the result from each invoked method (one result per each item in the array). Items that do not have their method invoked will not be included in the array.
#
# For example, if you wanted to call the "update" method with two arguments on all non-nil objects within an array called "items":
#
# # contrived class example used to provide a method that we could call
# class ExampleItem
#   # notice that this method always returns "updated"
#   def update(arg1, arg2)
#     @arg1 = arg1
#     @arg2 = arg2
#     "updated"
#   end
# end
#
# items = [ExampleItem.new, nil, ExampleItem.new]
#
# update_results = items.invoke(:update, "argument 1", "argument 2") {|item| item != nil}
# # update_result would == ['updated', 'updated']

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def invoke(name, *args, &block)
    self.each_with_object([]){|obj, res| res << obj.send(name, *args) if (block && block.call(obj)) || !block }
  end
end
