#===============================================================================================================
#                                               Description
#===============================================================================================================

# Background
# I was reading a book recently, "Things to Make and Do in the Fourth Dimension" by comedian and mathematician Matt Parker, and in the first chapter of the book Matt talks about problems he likes to solve in his head to take his mind off the fact that he is in his dentist's chair, we've all been there!
#
# The problem he talks about relates to polydivisible numbers, and I thought a kata should be written on the subject as it's quite interesting. (Well it's interesting to me, so there!)
#
# Polydivisib... huh what?
# So what are they?
#
# A polydivisible number is divisible in an unusual way. The first digit is cleanly divisible by 1, the first two digits are cleanly divisible by 2, the first three by 3 and so on.
#
# The interesting thing about polydivisiblity is that it relates to the underlying number, but not the base it is written in, so if aliens came to Earth and used base 23 (11 fingers on one hand and 12 on the other), no matter what squiggles they use to write numbers, they would find the same numbers polydivisible!
#
# Polydivisibilty Example:
# Let's do a worked example to clear up any questions ...
#
# Starting wih the number 1,232 in base 10 then:
#
#  1232
#  1    /1 = 1    Yay!
#  12   /2 = 6    Yay!
#  123  /3 = 41   Yay!
#  1232 /4 = 308  Yay!
# Thus 1,232 is a polydivisible number in base 4 and above.
#
# However starting wih the number 123,220 and using base 10 then:
#
#  123220
#  1      /1 = 1            Yay!
#  12     /2 = 6            Yay!
#  123    /3 = 41           Yay!
#  1232   /4 = 308          Yay!
#  12322  /5 = 2464.4       Oh no, that's not a round number!
#  123220 /6 = 220536.333r  Oh no, that's not a round number!
# Thus 123,220 is not a polydivisible base 10 number, but what about in another base?
#
# Again starting wih the number 123,220 and using base 6 then:
#
#  base 6   base 10
#  1      = 1       -> 1     /1 = 1     Yay!
#  12     = 8       -> 8     /2 = 4     Yay!
#  123    = 51      -> 51    /3 = 17    Yay!
#  1232   = 308     -> 308   /4 = 77    Yay!
#  12322  = 1850    -> 1850  /5 = 370   Yay!
#  123220 = 11100   -> 11100 /6 = 1850  Yay!
# Thus 123,220 is a polydivisible base 6 number (and a polydivisible base 10 number when converted to 11100 in base 10).
#
# Kata
# In this kata you must implement two methods: is_polydivisible(n, b) and get_polydivisible(n, b).
#
# The first is_polydivisible(n, b) will return True if n is polydivisible in base b or False if not.
#
# The second get_polydivisible(n, b) will return the nth polydivisible number using base b, the first polydivisible number is of course always 0.
#
# You can assume that all inputs are valid.
#
# Kata Examples:
#     is_polydivisible("1232", 10)   # => True
#     is_polydivisible("123220", 10) # => False
#     is_polydivisible("123220", 6)  # => True
#     get_polydivisible(22, 10)      # => "32"
#     get_polydivisible(22, 16)      # => "1A"
#     get_polydivisible(42, 16)      # => "42"
# A Note on Bases
# The maximum base used is base 62, and uses characters in the following order [0-9][A-Z][a-z] to denote its digits, base n will use the first n characters of this sequence.
#
# A constant CHARS has been declared with this sequence for you.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def translator_from10_to_any(n, base)
  res = []
  until n == 0
    res.unshift(n % base)
    n /= base
  end
  res
end

def convert(k, s, t)
  return t[0] if k == '0'
  inds = k.chars.map{|e| s.index(e)}
  base1, base2 = s.size, t.size
  num = inds.reverse.map.with_index{|n, i| n * base1**i }.sum
  res = translator_from10_to_any(num, base2)
  res.map{|i| t[i]}.join
end

def is_polydivisible(s, b)
  s.chars.each_index{|i| return false if convert(s[0..i], CHARS[0..b-1], CHARS[0..9]).to_i % (i+1) != 0 }
  true
end

def get_polydivisible(n, b)
  return '0' if n == 1
  counter = n - 1
  k = 1
  loop do
    m = convert(k.to_s, CHARS[0..9], CHARS[0..b-1])
    counter -= 1 if is_polydivisible(m, b)
    return m if counter == 0
    k += 1
  end
end
