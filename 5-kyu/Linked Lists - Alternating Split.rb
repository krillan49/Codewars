#===============================================================================================================
#                                               Description
#===============================================================================================================

# Linked Lists - Alternating Split
#
# Write an AlternatingSplit() function that takes one list and divides up its nodes to make two smaller lists. The sublists should be made from alternating elements in the original list. So if the original list is a -> b -> a -> b -> a -> null then one sublist should be a -> a -> a -> null and the other should be b -> b -> null.
#
# list = 1 -> 2 -> 3 -> 4 -> 5 -> nil
# alternating_split(list).first == 1 -> 3 -> 5 -> nil
# alternating_split(list).second == 2 -> 4 -> nil
# For simplicity, we use a Context object to store and return the state of the two linked lists. A Context object containing the two mutated lists should be returned by AlternatingSplit().
#
# If the passed in head node is null/None/nil or a single node, throw an error.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Node
	attr_accessor :data, :next
  def initialize(data, nextN = nil)
    @data = data
    @next = nextN
  end
end

class Context
  attr_accessor :first, :second
  def initialize(first, second)
    @first = first
    @second = second
  end
end

def first_second(head, first, i=0)
  return nil if !head
  if (i % 2 != 0 && first) || (i % 2 == 0 && !first)
    head = head.next
    i += 1
  end
  head ? Node.new(head.data, first_second(head.next, first, i+1)) : nil
end

def alternating_split(head)
  raise "Error Message" if !head
  Context.new(first_second(head, true), first_second(head, false))
end
