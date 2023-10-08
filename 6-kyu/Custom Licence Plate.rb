#===============================================================================================================
#                                               Description
#===============================================================================================================

# In the fictional country of Bugliem, you can ask for a custom licence plate on your car, provided that it meets the followoing criteria:
#
# it's 2-8 characters long
# it contains only letters A-Z, numbers 0-9, and dashes -
# letters and numbers are separated by a dash
# it doesn't start or end with a dash, and it doesn't have consecutive dashes
# it's not made up of numbers only
# You also have to pay 1000 local units to obtain one, although this will not be tested.
#
# Task
# To make the life of the local authorities easier (and get your driving record cleaned), you need to implement a function that accepts an ascii input string, and returns the number plate if possible.
#
# You have to replace all special characters and spaces with dashes (consecutive characters should be replaced with a single dash), and truncate the result to maximum 8 characters (if longer). If the result complies with the above criteria, return it capitalized; otherwise return "not possible".
#
# Examples
# "mercedes"    -->  "MERCEDES"
# "anter69"     -->  "ANTER-69"
# "1st"         -->  "1-ST"
# "~c0d3w4rs~"  -->  "C-0-D-3"
# "I'm cool!"   -->  "I-M-COOL"
# "1337"        -->  "not possible"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def licence_plate(s)
  return 'not possible' if s.tr('^a-zA-Z','') == '' or s.tr('^a-zA-Z0-9','').size < 2
  r = s.upcase.split(/[^\dA-Z]/).reject(&:empty?).join('-').chars
  .slice_when{|a, b| (/[\d]/ === a && /[A-Z]/ === b) or (/[\d]/ === b && /[A-Z]/ === a)}.map(&:join).join('-')[0..7]
  r[-1] == '-' ? r[0..-2] : r
end
