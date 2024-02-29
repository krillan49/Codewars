#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement the function longest(array,n) where you will be given an array of strings and then return the nth longest string in that array. For example         arr = ['Hello','World','Codewars','Katas']  with n = 3  should return 'World' because 'Codewars' length = 8 , 'Hello' length = 5, so that is the 2nd longest word and then 'World' (although also word length of 5, 'World' is after 'Hello' in the array). When words have the same lengths, treat them in the order in which they exist in the array. Array will never be empty and n > 0 always.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def longest(arr,n)
  arr.map.with_index{|w, i| [w.size, i , w]}.sort_by{|a| [-a[0], a[1]]}[n-1][2]
end
