#===============================================================================================================
#                                               Description
#===============================================================================================================

# Alex is a devoted fan of snooker Masters and in particular, he recorded results of all matches. Help Alex to know the score of matches.
#
# Hint:
# A string with a score presented as follows: "24-79(72); 16-101(53); ..."
# "24" - Points scored the first player;
# "79" - the number of points of the second player.
# "(72)" - the maximum score for one approach.
# Also, the player's account may be expressed as 105(53,52):
# "105" - points in the frame, "53" and "52" - two separate numbers(not float) maximum points in the frame.
# Frames are separated by ";" and players score - "-"
# It should count the number of frames won by one and another player, and output the data as a "[10,7]"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def frame(score)
  r = score.gsub(%r!\((\d+|\d+,\d+)\)!, '').split('; ').map{|w| w.split('-')[0].to_i > w.split('-')[1].to_i ? [1, 0] : [0,1]}
  [r.map{|a| a[0]}.flatten.sum, r.map{|a| a[1]}.flatten.sum]
end
