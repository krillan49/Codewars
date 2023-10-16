#===============================================================================================================
#                                               Description
#===============================================================================================================

# Most languages have a split function that lets you turn a string like “hello world” into an array like[“hello”, “world”]. But what if we don't want to lose the separator? Something like [“hello”, “ world”].
#
# Task:
# Your job is to implement a function, (split_without_loss in Ruby/Crystal, and splitWithoutLoss in JavaScript/CoffeeScript), that takes two arguments, str (s in Python), and split_p, and returns the string, split by split_p, but with the separator intact. There will be one '|' marker in split_p. str or s will never have a '|' in it. All the text before the marker is moved to the first string of the split, while all the text that is after it is moved to the second one. Empty strings must be removed from the output, and the input should NOT be modified.
#
# When tests such as (str = "aaaa", split_p = "|aa") are entered, do not split the string on overlapping regions. For this example, return ["aa", "aa"], not ["aa", "aa", "aa"].
#
# Examples (see example test cases for more):
# split_without_loss("hello world!", " |") #=> ["hello ", "world!"]
# split_without_loss("hello world!", "o|rl") #=> ["hello wo", "rld!"]
# split_without_loss("hello world!", "h|ello world!") #=> ["h", "ello world!"]
# split_without_loss("hello world! hello world!", " |")
#                   #=> ["hello ", "world! ", "hello ", "world!"]
# split_without_loss("hello world! hello world!", "o|rl")
#                   #=> ["hello wo", "rld! hello wo", "rld!"]
# split_without_loss("hello  hello  hello", " | ")
#                   #=> ["hello ", " hello ", " hello"]
# split_without_loss(" hello world", " |")
#                   #=> [" ", "hello ", "world"]
# split_without_loss("  hello hello hello", " |")
#                   #=> [" ", " ", "hello ", "hello ", "hello"]
# split_without_loss("  hello hello hello  ", " |")
#                   #=> [" ", " ", "hello ", "hello ", "hello ", " "]
# split_without_loss("  hello hello hello", "| ")
#                   #=> [" ", " hello", " hello", " hello"]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def split_without_loss(str, split_p)
  split_p = split_p.split('|', -1)
  sa, sb = split_p[0], split_p[1]
  strmod = str.gsub(/#{sa+sb}/, "#{sa}|#{sb}")
  strmod.chars.slice_when{|a, b| a == '|' or b == '|'}.reject{|e| e == ['|']}.map(&:join)
end
