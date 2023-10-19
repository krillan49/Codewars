#===============================================================================================================
#                                               Description
#===============================================================================================================

# The prisoners from previous challenges love playing chess so they make extra plan C in communcation , it goes as follows.
#
# They distribute the 26 letters on the standard 8 x 8 chess board as shown below :
#
# https://i.imgur.com/Sbdzpaa.jpg
# https://i.imgur.com/zO5VwkV.png
#
# Then they assign every letter to its location on the board as described below:
#
# https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/SCD_algebraic_notation.svg/242px-SCD_algebraic_notation.svg.png
#
# So character v would correspond to a1 and u would be b1, etc..
#
# NOTE: during the encryption words are separated by space
#
# Example
# For: msg = "hi", the result should be: "e5e4"
#
# For: msg = "play again", the result should be: "g1f2d3c2 d3e6d3e4h2"
#
# Input/Output
# [input] string msg
# message input.
#
# [output] a string
# encrypted message.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

ENC = {
  "a"=>'d3', "b"=>'d4', "c"=>'d5', "d"=>'d6', "e"=>'d7', "f"=>'e7', "g"=>'e6',
  "h"=>'e5', "i"=>'e4', "j"=>'e3', "k"=>'e2', "l"=>'f2', "m"=>'g2', "n"=>'h2',
  "o"=>'h1', "p"=>'g1', "q"=>'f1', "r"=>'e1', "s"=>'d1', "t"=>'c1', "u"=>'b1',
  "v"=>'a1', "w"=>'a2', "x"=>'b2', "y"=>'c2', "z"=>'d2'
}

def chess_encryption(msg)
  msg.chars.map{|c| ENC[c] ? ENC[c] : c}.join
end
