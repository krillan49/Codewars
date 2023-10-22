#===============================================================================================================
#                                               Description
#===============================================================================================================

# I have started studying electronics recently, and I came up with a circuit made up of 2 LEDs and 3 buttons.
#
# Here 's how it works: 2 buttons (red and blue) are connected to the LEDs (red and blue respectively). Buttons pressing pattern will be remembered and represented through the LEDs when the third button is pressed.
#
# Only one LED can blink at a time.
# The LED will only blink once even if the button is held down.
# The button must be released to be pressed again.
# If a button is pressed while the other button is being held down, it will be ignored.
# If two buttons are pressed simultaneously, the red button will be preferred.
# If a button is released while the other is being held down, the other 's LED will blink.
# 0 is up and 1 is down.
# The two inputs will always have the same length.
# Here is an example:
#
# Red:  "10011010"
# Blue: "10110111"
# #=> "RBRB"
#
# Red:  "01001000"
# Blue: "01011100"
# #=> "RB"
#
# Red:  "01101000"
# Blue: "00111000"
# #=> "RB"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

HH = {'00'=>' ', '01'=>'B', '10'=>'R', '11'=>'R'}

def button_sequences(seqR, seqB)
  return '' if [seqR, seqB].any?{|e| e == ''}
  arr = seqR.chars.zip(seqB.chars).map(&:join)
  c = nil
  arr.each_with_object([]) do |e, res|
    if e == '00'
      res << HH[e]
      c = nil
    elsif !c
      res << HH[e]
      c = HH[e]
    elsif c == 'R' && e == '01'
      res << HH[e]
      c = 'B'
    elsif c == 'B' && e == '10'
      res << HH[e]
      c = 'R'
    end
  end
  .join.split.join
end
