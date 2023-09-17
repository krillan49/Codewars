#===============================================================================================================
#                                               Description
#===============================================================================================================

# Many of you, happy & honest codewarriors, are probably wondering the same thing looking at the CW leaderboard:
#
# How can someone gain so many points (more than 30000) in CW?
# How can someone publish dozens of new kata a day?
# How can someone speak chinese (uh, no, not that question, shame on you !)
# How can...
# Ok, ok, ok! We get the picture! The answer is very simple:
#
# Most of these "warriors" are aliens from the 5th dimension, come to earth to torment the poor humans
#
# The good news is: we can examine their names to find who they really are.
#
# Your Task :
# You may code a checkUser/check_user function to check a userName/user_name to see who he/she is. The algorithm is:
#
# 1.) "Un-leet" the name; replace 0123456789 with olzeasbtBg respectively (e.g. replace 0 with "o", 6 with "b", 2 with "z". . .)
#
# 2.) Get the "binary" value of the name, by taking the name of the Imp of Imps himself, Mxyzptlk, and replacing each letter in his name with a 1 if it is present in user's name, and a 0 if it's not (ignore case)
#
# 3.) Compute the 5th dimension level by dividing the decimal value of "bin"-value by 255 and multiplying by 100:
#
# fifth_dimension_level = 100.0 * binary_value.to_i(2) / 255.0
# 4.) Finally, depending of this final score, return a comment:
#
#   score : comment to be returned
# --------+------------------------------------------------------------------------------
#  <  1   : "This one's too clean, should be a bot."
#  <  50  : "This one seems ok, may be there's still some humans around here..."
#  <  90  : "This one's probably an alien from 5th dim, be careful!"
#  >= 90  : "Yeeerk!!! Mr Mxyztplk himself the imp of imps! Only Superman can beat him!"
# These messages are preloaded in an array MSGS
#
# Example:
# name : 'Am4b0'
# 1. unleet --> 'Amabo'
# 2. bin-value: 'Mxyzptlk' -> '10000000' (only the 'M' matches Amabo)
# 3. level: `10000000` to decimal -> 128, 100*128/255 -> ~ 50.19607843137255
# 4. msg: "This one's probably an alien from 5th dim, be careful!" (==MSGS[2] )
# Note:
# More info on the 5th dimension menace

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def check_user(user_name)
  w = user_name.tr('0123456789', 'olzeasbtBg').downcase
  n = 'Mxyzptlk'.downcase.chars.map{|e| w.include?(e) ? '1' : '0'}.join.to_i(2) * 100.0 / 255
  if n < 1
    "This one's too clean, should be a bot."
  elsif n < 50
    "This one seems ok, may be there's still some humans around here..."
  elsif n < 90
    "This one's probably an alien from 5th dim, be careful!"
  else
    "Yeeerk!!! Mr Mxyztplk himself the imp of imps! Only Superman can beat him!"
  end
end
