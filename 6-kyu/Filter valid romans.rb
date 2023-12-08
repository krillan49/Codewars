#===============================================================================================================
#                                               Description
#===============================================================================================================

# Complete the function that receives an array of strings (arr) as an argument and returns all the valid Roman numerals.
#
# Basic Roman numerals are denoted as:
#
# I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000
# For the purposes of this kata we will consider valid only the numbers in range 0 - 5000 (both exclusive) since numbers >= 5000 were written in a different way (you had to place a heavy bar over the numeral that meant it was multiplied with 1000).
#
# There are other ways of tackling this problem but the easiest is probably writing a Regular Expression.
#
# Let's break the problem down:
# To match a set of characters /[1-9]/(single digits) you should take into consideration the Roman numbers I, II, III, IV, V, VI, VII, VIII, IX. This could be done by testing with /IX|IV|V?I{0,3}/. This part /I{0,3}/ matches I, II or III but we have a V appearing 0 or 1 times because of the ? so /V?I{0,3}/ would match I,II,III,V,VI,VII or VIII. However there is one flaw with this. Do you see it? It is the fact that it would also match an empty string "" because of the {0,3}. In order to pass the tests you will have to filter out the empty strings as well. So the entire part matches I to IX(inclusive) but what about larger digits?
#
# Use the same logic for the digit in the tens place and the hundreds place. Be sure to wrap each part (units, tens, hundreds, thousands) in a pair of braces (IX|IV|V?I{0,3}) and for the digit in the thousands place the logic is pretty straight forward, you just have to match M 0 to 4 times (since 5000 is not included). Wrap everything up with ^ and $ to make sure you match the entire string (^ matches from the beginning of the string, while $ denotes the end, meaning there is nothing after that sign.
#
# Examples
# ["I", "IIV", "IVI", "IX", "XII", "MCD"] ==> ["I", "IX", "XII", "MCD"]
#
# ["MMMMCMXCIX", "MMDCXLIV", "MMCIX", "CLD", "LCD"]) ==> ["MMMMCMXCIX", "MMDCXLIV", "MMCIX"]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

ROMAN = {
  1=>'I', 2=>'II', 3=>'III', 4=>'IV', 5=>'V', 6=>'VI', 7=>'VII', 8=>'VIII', 9=>'IX',
  10=>'X', 20=>'XX', 30=>'XXX', 40=>'XL', 50=>'L', 60=>'LX', 70=>'LXX', 80=>'LXXX', 90=>'XC',
  100=>'C', 200=>'CC', 300=>'CCC', 400=>'CD', 500=>'D', 600=>'DC', 700=>'DCC', 800=>'DCCC', 900=>'CM',
  1000=>'M', 2000=>'MM', 3000=>'MMM', 4000=>'MMMM'
}

def to_roman(n)
  n.digits.map.with_index{|e, i| ROMAN[e * 10**i]}.reverse.join
end

def from_roman(r)
  res = r.chars
         .slice_when do |a, b|
           (a == 'M' && b != 'M') ||
           (%w[M D C].include?(a) && !%w[M D C].include?(b)) ||
           (%w[C L X].include?(a) && !%w[D C L X M].include?(b))
         end
         .map{|a| ROMAN.key(a.join)}
  res.include?(nil) || res.sort.reverse != res ? nil : res.sum
end

def valid_romans(arr)
  arr.select{|e| e != '' && from_roman(e) && to_roman(from_roman(e)) == e}
end
