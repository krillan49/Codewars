#===============================================================================================================
#                                               Description
#===============================================================================================================

# Similarly to the previous kata, you will need to return a boolean value if the base string can be expressed as the repetition of one subpattern.
#
# This time there are two small changes:
#
# if a subpattern has been used, it will be present at least twice, meaning the subpattern has to be shorter than the original string;
# the strings you will be given might or might not be created repeating a given subpattern, then shuffling the result.
# For example:
#
# has_subpattern("a") == false #no repeated shorter sub-pattern, just one character
# has_subpattern("aaaa") == true #just one character repeated
# has_subpattern("abcd") == false #no repetitions
# has_subpattern("babababababababa") == true #repeated "ba"
# has_subpattern("bbabbaaabbaaaabb") == true #same as above, just shuffled
# Strings will never be empty and can be composed of any character (just consider upper- and lowercase letters as different entities) and can be pretty long (keep an eye on performances!).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def has_subpattern(s)
  return false if s.size < 2
  dels = (2..s.size/2).select{|d| s.size % d == 0}
  nums = s.chars.uniq.map{|c| s.count(c)}
  dels.each{|d| return true if nums.all?{|e| e % d == 0}}
  false
end
