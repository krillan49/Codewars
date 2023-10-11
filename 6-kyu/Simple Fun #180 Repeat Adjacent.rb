#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a string s. Let's call its substring a group, if all letters in it are adjacent and the same(such as "aa","bbb","cccc"..). Let's call the substring with 2 or more adjacent group a big group(such as "aabb","bbccc"...).
#
# Your task is to count the number of big groups in the given string.
#
# Example
# For s = "ccccoodeffffiiighhhhhhhhhhttttttts", the result should be 3.
#
# The groups are "cccc", "oo", "ffff", "iii", "hhhhhhhhhh", "ttttttt"
# The big groups are "ccccoo", "ffffiii", "hhhhhhhhhhttttttt",
# 3 substrings altogether.```
#
# For `s = "gztxxxxxggggggggggggsssssssbbbbbeeeeeeehhhmmmmmmmitttttttlllllhkppppp"`, the result should be `2`.
# The big groups are : "xxxxxggggggggggggsssssssbbbbbeeeeeeehhhmmmmmmm" and "tttttttlllll" ```
#
# For s = "soooooldieeeeeer", the result should be 0.
#
# There is no big group exist.
#
# Input/Output
# [input] string s
# A string of lowercase Latin letters.
#
# [output] an integer
# The number of big groups.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def repeat_adjacent(string)
  string.chars.slice_when{|a, b| a != b}.map(&:join).map{|s| s.size == 1 ? ' ' : s}.join.split.count{|s| s.chars.uniq.size > 1}
end
