#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a function validate_iban which checks if a given string is a valid IBAN.

# Have a look at the wikipedia-entry for a easy-description of the algorithm: https://en.wikipedia.org/wiki/International_Bank_Account_Number#Validating_the_IBAN

# IBAN-Length and Countries are taken from https://www.iban.com/structure.html and refere to the state from "03/05/2017". You will have access to a (preloaded) dictionary (called @COUNTRIES) containing id's and their corresponding length.

# You should also ignore every character which is not part of the IBAN.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. You need to remove all extra characters from the string (leave only capital letters and numbers)
# Example: "AT48-3200 0000 1234-5864" -> "AT483200000012345864"

# 2. Check that the total IBAN length is correct as per the country. If not, the IBAN is invalid(@COUNTRIES)
# Example: @COUNTRIES['AT'] == 20 and "AT483200000012345864".size == 20 -> go to next step

# 3. Move the four initial characters to the end of the string
# Example: "AT483200000012345864" -> "3200000012345864AT48"

# 4. Replace each letter in the string with two digits, thereby expanding the string, where A = 10, B = 11, ..., Z = 35
# Example: A -> 10, T -> 29, "3200000012345864AT48" -> "3200000012345864102948"

# 5. Interpret the string as a decimal integer and compute the remainder of that number on division by 97. If the remainder is 1, the check digit test is passed and the IBAN might be valid.
# Example: 3200000012345864102948 % 97 == 1  ->  return true

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def validate_iban(text)
  text = text.tr('^A-Z0-9', '')
  return false if @COUNTRIES[text[0..1]] != text.size
  (text[4..-1] + text[0..3]).chars.map{|e| /[A-Z]/ === e ? e.ord - 55 : e}.join.to_i % 97 == 1
end
