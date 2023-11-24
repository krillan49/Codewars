#===============================================================================================================
#                                               Description
#===============================================================================================================

# Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.
#
# Allowed items are defined by array of numbers.
#
# Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:
#
# pockets = {
#   bob: [1],
#   tom: [2, 5],
#   jane: [7]
# }
# Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.
#
# find_suspects(pockets, [1, 2]) # => [:tom, :jane]
# find_suspects(pockets, [1, 7, 5, 2]) # => nil
# find_suspects(pockets, []) # => [:bob, :tom, :jane]
# find_suspects(pockets, [7]) # => [:bob, :tom]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_suspects(pockets, items)
  return nil if pockets == {}
  poc = pockets.reject{|_,v| !v}.select{|_,v| v.any?{|i| !items.include?(i)}}
  return nil if poc == {}
  poc.map(&:first)
end
