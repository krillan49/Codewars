#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a method that takes a nested hash (object in javascript) as input and returns that hash with added "depth" keys. So, for example, the following input:
#
# tree = {
#   a: 1,
#   b: 2,
#   c: { d: { e: 3 } }
# }
# would yield the following return value:
#
# {
#   a: 1,
#   b: 2,
#   c: {
#     d: {
#       e: 3,
#       depth: 2
#     },
#     depth: 1
#   },
#   depth: 0
# }
# For Ruby, if the input is not a hash, then the function should return nil. For JavaScript, if the input is not an object (including an array), the function should return null.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def depth(tree, count)
  tree[:depth] = count
  tree.each do |k, v|
    tree[k] = depth(v,count+1) if v.class == Hash
  end
end

def record_depth(tree)
  return nil if tree.class != Hash
  depth(tree, 0)
end
