#===============================================================================================================
#                                               Description
#===============================================================================================================

# Story
# The word is on the street that you claim to be a safe-cracking jewel thief.
#
# But are you?
#
# This Kata will verify your safe-cracking abilities.
#
# Kata
# To prove you are a real thief you need to crack the combination of the safe, and then open it and tell me the value of the jewels inside!
#
# The safe object has two methods:
#
# Method	Parameter	Returns
# Type	Meaning
# `unlock`	combination	string	Sounds you can hear
# No Sound
# click	The first part of the combination is correct
# click-click	The first two parts of the combination are correct
# click-click-click	The combination is correct.
# Now you can turn the handle to open the safe.
#
# `open`	-	int	The value of the safe contents (range 0 - 100,000)
# Combination Format
# The safe combination is made up of 3 dial spins.
#
# safe-dial
# Spin the dial left L or right R
# Numbers on the dial 00 - 99
# Each part of the combination is separated by -
# e.g. L23-R67-R09

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def cracker(safe, *codes)
  ('00'..'99').cycle do |code|
    return "L#{code}" if safe.unlock((codes + ["L#{code}"]).join('-')) == (['click'] * (codes.size + 1)).join('-')
    return "R#{code}" if safe.unlock((codes + ["R#{code}"]).join('-')) == (['click'] * (codes.size + 1)).join('-')
  end
end

def crack(safe)
  code1 = cracker(safe)
  code2 = cracker(safe, code1)
  code3 = cracker(safe, code1, code2)
  safe.unlock("#{code1}-#{code2}-#{code3}")
  safe.open
end
