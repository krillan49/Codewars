#===============================================================================================================
#                                               Description
#===============================================================================================================

# Oh, how cursed we are to have but 10 digits upon our fingers. Imagine the possibilities were we able to count to numbers beyond! But halt! With 10 digits upon our two appendages, 1024 unique combinations appear! But alas, counting in this manner is cumbersome, and counting to such a number beyond reason. Surely being able to count up to 100 would suffice!
#
# You will be given inputs which correspond to the 10 digits of a pair of hands in the following format, where 1 means the finger is raised, and 0 means the finger is down.
#
# Example:
#
# LP	LR	LM	LI	LT	RT	RI	RM	RR	RP
# 0	1	1	1	0	1	1	1	0	0
# Where the fingers are represented by:
#
# L = Left (hand)
# R = Right (hand)
# P = Pinky
# R = Ring finger
# M = Middle finger
# I = Index finger
# T = Thumb
# Your challenge is to take this input of 0s and 1s, and:
#
# Determine if it is valid based on this counting scheme;
# IF valid: Decode the inputs into the number represented by the digits on the hand and return the Integer value;
# IF invalid: Return -1.
# Examples
# 0111011100 -> 37
# 1010010000 -> Invalid
# 0011101110 -> 73
# 0000110000 -> 55
# 1111110001 -> Invalid

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def count_with_fingers(fingers)
  lf = fingers[0..3].chars
  lf[0..-2].each.with_index{|e, i| return -1 if e == '1' && lf[i+1..-1].include?('0')}
  rf = fingers[-4..-1].chars.reverse
  rf[0..-2].each.with_index{|e, i| return -1 if e == '1' && rf[i+1..-1].include?('0')}
  [10, 10, 10, 10, 50, 5, 1, 1, 1, 1].zip(fingers.chars.map(&:to_i)).sum{|a| a.inject(:*)}
end
