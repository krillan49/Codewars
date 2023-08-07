#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a class that, when given a string, will return an uppercase string with each letter shifted forward in the alphabet by however many spots the cipher was initialized to.
#
# For example:
#
# c = CaesarCipher.new(5); # creates a CipherHelper with a shift of five
# c.encode('Codewars') # returns 'HTIJBFWX'
# c.decode('BFKKQJX') # returns 'WAFFLES'
# If something in the string is not in the alphabet (e.g. punctuation, spaces), simply leave it as is.
# The shift will always be in range of [1, 26].

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class CaesarCipher
  def initialize(shift)
    @abc = ('A'..'Z').to_a
    @abc_mod = ('A'..'Z').to_a[shift..-1] + ('A'..'Z').to_a[0...shift]
  end

  def encode(string)
    string.upcase.split('').each_with_object([]){|c, arr| arr << (@abc.include?(c) ? @abc_mod[@abc.index(c)] : c)}.join
  end

  def decode(string)
    string.split('').each_with_object([]){|c, arr| arr << (@abc.include?(c) ? @abc[@abc_mod.index(c)] : c)}.join
  end
end
