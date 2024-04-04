#===============================================================================================================
#                                               Description
#===============================================================================================================

# You have a class called Node, representing a node in a binary tree (https://en.wikipedia.org/wiki/Binary_tree).
#
# Each node has 2 children - the right child and the left child. These children can of course be null.
#
# You job is to add an instance method, height, which returns the longest branch steming from the tree (starting from this node). For example, this tree would result in 3:
#
#         (Node)
#         /    \
#     (Node)  (Node)
#     /          \
#   (Node)      (Node)
#        \
#       (Node)
#
# Recursion is not necessary, but highly recommended.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Node
  attr_accessor :r_node, :l_node

  def initialize(r_node = nil, l_node = nil)
    self.r_node = r_node
    self.l_node = l_node
  end

  def height(n=0)
    [l_node ? l_node.height(n+1) : n, r_node ? r_node.height(n+1) : n].max
  end
end
