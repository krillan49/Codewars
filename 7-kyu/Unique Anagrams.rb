#===============================================================================================================
#                                               Description
#===============================================================================================================

# You will be given a list of words that are anagrams of each other. Your task is to find a unique anagram using the same letters - i.e. your result must be different to each word in the list.
#
# Your result can be any valid answer, i.e. if there is more than one possible unused anagram, you may choose any of them to return.
#
# If there is no valid answer, return an empty string.
#
# Samples
# INPUT  =>  OUTPUT
# abcd, dbac, cbad  =>  dbca
# 12  =>  21
# codewars, srawedoc  =>  edocraws
# 123, 132, 213, 231, 321, 312  =>  (empty string)

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# brute force works

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def anagram(words)
  (words[0].chars.permutation.map(&:join) - words).first || ''
end
