#===============================================================================================================
#                                               Description
#===============================================================================================================

# Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.
#
# Examples
# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
# pig_it('Hello world !')     # elloHay orldway !

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def pig_it text
  text.split.map{|e| e[0].ord < 65 ? e : e[1..-1] + e[0] + 'ay'}.join(' ')
end
