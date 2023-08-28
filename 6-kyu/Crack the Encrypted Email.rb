#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your friend Johnny is the owner of 'Fresho', a well known gelato parlour in town.
#
# Business has dropped recently however, as two new gelato parlours have opened nearby: 'Freshy' and 'Mama's Gelato'.
# Johnny suspects that these new parlours are colluding and fixing their prices.
#
# Today the owner of Mama's Gelato ACCIDENTLY sent Johnny a suspicious email:
#
# "ikhcxvmutgdknimykxlahluxzbgvhffngbvtmbhgehpxkzxetmhikbvxlurmabkmrixkvxgmhgmnxlwtrtgwkxwnvxfbedlatdxikbvxlurtmextlmhgxwheetk"
# '///instructions:///'
# "rot only lowercase a to z"
# Your task:
#
# Write a method that takes this encrypted email and returns the decrypted message.
#
#
# Good luck, Johnny is counting on you.
# --hint--
# if this email is indeed about price fixing, consider the kinds of words it would include

#===============================================================================================================
#                                               Solution
#===============================================================================================================

WORDS = %w[project bank price percent dollar cent sale]

def crack(text)
  (0..25).each do |shift|
    sd = ('a'..'z').to_a.rotate(shift).join
    crtext = text.tr('a-z', "#{sd}")
    return crtext if WORDS.any?{|w| crtext.include?(w)}
  end
end
