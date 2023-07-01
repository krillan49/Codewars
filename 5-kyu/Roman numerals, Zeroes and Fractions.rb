#===============================================================================================================
#                                               Description
#===============================================================================================================

# We all know about Roman Numerals, and if not, here's a nice introduction kata. And if you were anything like me, you 'knew' that the numerals were not used for zeroes or fractions; but not so!
#
# I learned something new today: the Romans did use fractions and there was even a glyph used to indicate zero.
#
# So in this kata, we will be implementing Roman numerals and fractions.
#
# Although the Romans used base 10 for their counting of units, they used base 12 for their fractions. The system used dots to represent twelfths, and an S to represent a half like so:
#
# 1/12 = .
# 2/12 = :
# 3/12 = :.
# 4/12 = ::
# 5/12 = :.:
# 6/12 = S
# 7/12 = S.
# 8/12 = S:
# 9/12 = S:.
# 10/12 = S::
# 11/12 = S:.:
# 12/12 = I (as usual)
# Further, zero was represented by N
#
# Kata
# Complete the method that takes two parameters: an integer component in the range 0 to 5000 inclusive, and an optional fractional component in the range 0 to 11 inclusive.
#
# You must return a string with the encoded value. Any input values outside the ranges given above should return "NaR" (i.e. "Not a Roman" :-)
#
# Examples
# roman_fractions(-12)     #=> "NaR"
# roman_fractions(0, -1)   #=> "NaR"
# roman_fractions(0, 12)   #=> "NaR"
# roman_fractions(0)       #=> "N"
# roman_fractions(0, 3)    #=> ":."
# roman_fractions(1)       #=> "I"
# roman_fractions(1, 0)    #=> "I"
# roman_fractions(1, 5)    #=> "I:.:"
# roman_fractions(1, 9)    #=> "IS:."
# roman_fractions(1632, 2) #=> "MDCXXXII:"
# roman_fractions(5000)    #=> "MMMMM"
# roman_fractions(5001)    #=> "NaR"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

RIN = {
  1=>'I', 2=>'II', 3=>'III', 4=>'IV', 5=>'V', 6=>'VI', 7=>'VII', 8=>'VIII', 9=>'IX',
  10=>'X', 20=>'XX', 30=>'XXX', 40=>'XL', 50=>'L', 60=>'LX', 70=>'LXX', 80=>'LXXX', 90=>'XC',
  100=>'C', 200=>'CC', 300=>'CCC', 400=>'CD', 500=>'D', 600=>'DC', 700=>'DCC', 800=>'DCCC', 900=>'CM',
  1000=>'M', 2000=>'MM', 3000=>'MMM', 4000=>'MMMM', 5000=>'MMMMM'
}
RFR = { 6=>'S', 5=>':.:', 4=>'::', 3=>':.', 2=>':', 1=>'.' }

def roman_fractions(int, frac = 0)
  return 'NaR' if int < 0 or int > 5000 or frac < 0 or frac > 11
  return 'N' if int == 0 and frac == 0
  i = int.digits.map.with_index{|e, i| RIN[e * 10**i]}.reverse.join || ''
  f = frac == 0 ? '' : frac > 6 ? 'S' + RFR[frac-6] : RFR[frac]
  i + f
end
