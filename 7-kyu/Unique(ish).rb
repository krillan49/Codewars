#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# Write a function unique which takes an array of strings, and returns an array of unique strings.
#
# The tricky part is that case and punctuation don't matter to this function.
#
# punctuation: ':', ';', ''', ',', '.', '?', '!'
# strings: consists of the letters of the alphabet (uppercase / lowercase), optionally with punctuation
# keep the first occurence of any string that is unique given the specification
# Example
# unique(["hello", "Hello", "Hello!", "world!"])
#
# Would return:
#
# => ["hello", "world!"]

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# Try gsub method

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def unique strings
  strings.each_with_object([]) do |str, arr|
    arr << str if arr.all?{ |w| w.downcase.gsub(/[^a-z]/, '') != str.downcase.gsub(/[^a-z]/, '') }
  end
end
