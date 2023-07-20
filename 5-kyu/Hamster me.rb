#===============================================================================================================
#                                               Description
#===============================================================================================================

# Hamsters are rodents belonging to the subfamily Cricetinae. The subfamily contains about 25 species, classified in six or seven genera. They have become established as popular small house pets, and, partly because they are easy to breed in captivity, hamsters are often used as laboratory animals. Wikipedia Link
#
# hamster
#
# And you could have skipped the introduction as it is entirely unrelated to your task. xD
#
# Task
# Write a function that accepts two inputs: code and message and returns an encrypted string from message using the code.
# The code is a string that generates the key in the way shown below:
#
#  1  | h a m s t e r
#  2  | i b n   u f
#  3  | j c o   v g
#  4  | k d p   w
#  5  | l   q   x
#  6  |         y
#  7  |         z
# All letters from code get number 1. All letters which directly follow letters from code get number 2 (unless they already have a smaller number assigned), etc. It's difficult to describe but it should be easy to understand from the example below:
#
#  1  | a e h m r s t
#  2  | b f i n     u
#  3  | c g j o     v
#  4  | d   k p     w
#  5  |     l q     x
#  6  |             y
#  7  |             z
# How does the encoding work using the hamster code?
#
# a => a1
# b => a2
# c => a3
# d => a4
# e => e1
# f => e2
# ...
# And applying it to strings :
#
# hamsterMe('hamster', 'hamster')   => h1a1m1s1t1e1r1
# hamsterMe('hamster', 'helpme')    => h1e1h5m4m1e1
# And you probably started wondering what will happen if there is no a in the code.
# Just add these letters after the last available letter (in alphabetic order) in the code.
#
# The key for code hmster is:
#
#  1  | e h m r s t
#  2  | f i n     u
#  3  | g j o     v
#  4  |   k p     w
#  5  |   l q     x
#  6  |           y
#  7  |           z
#  8  |           a
#  9  |           b
# 10  |           c
# 11  |           d
# Additional notes
# The code will have at least 1 letter.
# Duplication of letters in code is possible and should be handled.
# The code and message consist of only lowercase letters.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def hamster_me(code, message)
  code = code.chars.uniq.sort.each_cons(code.size > 1 ? 2 : 1).to_a # code ranges
  abc = ('a'..'z').to_a
  abc.rotate! until abc[0] == code[0][0]
  cc = Hash.new([])
  abc.each do |c| # distribution of the alphabet by the letters of the code
    size = cc.to_a.flatten.size
    r = code.find{|a| (a[0].ord...a[-1].ord).include?(c.ord)}
    cc[r[0]] += [c] if r
    cc[code[-1][-1]] += [c] if size == cc.to_a.flatten.size # for the last letter or if there is no 'a' in the code
  end
  ccc = {}
  cc.each{|k, vs| vs.each.with_index(1){|v, i| ccc[v] = "#{k}#{i}"}}
  message.chars.map{|e| ccc[e]}.join
end
