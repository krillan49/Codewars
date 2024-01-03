#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a function that accepts a string consisting only of ASCII letters and space(s) and returns that string in block letters of 5 characters width and 7 characters height, with one space between characters.
#
# The string should be formatted in a way that when passed to Rubys' puts() function shows the desired output (see below for example).
#
# The block letters should consist of corresponding capital letters.
# It's irrelevant whether input consists of lower or upper case letters.
# Any leading and/or trailing spaces in input should be ignored.
# Empty strings or such containing only spaces should return an empty string.
# The remaining spaces (between letters and/or words) are to be treated as any other character. This means that there will be six spaces in output for a space in input, or a multiple of six, if there were more spaces - plus the one from preceding character!
# Trailing spaces should be removed in the resulting string.
# puts(block_print('heLLo WorLD'))
# should result in an output that looks like this:
#
# H   H EEEEE L     L      OOO        W   W  OOO  RRRR  L     DDDD
# H   H E     L     L     O   O       W   W O   O R   R L     D   D
# H   H E     L     L     O   O       W   W O   O R   R L     D   D
# HHHHH EEEEE L     L     O   O       W W W O   O RRRR  L     D   D
# H   H E     L     L     O   O       W W W O   O R R   L     D   D
# H   H E     L     L     O   O       W W W O   O R  R  L     D   D
# H   H EEEEE LLLLL LLLLL  OOO         W W   OOO  R   R LLLLL DDDD

#===============================================================================================================
#                                               Solution
#===============================================================================================================

$lets={
  ' ' => ['     ','     ','     ','     ','     ','     ','     '],
  'A' => [' AAA ','A   A','A   A','AAAAA','A   A','A   A','A   A'],
  'B' => ['BBBB ','B   B','B   B','BBBB ','B   B','B   B','BBBB '],
  'C' => [' CCC ','C   C','C    ','C    ','C    ','C   C',' CCC '],
  'D' => ['DDDD ','D   D','D   D','D   D','D   D','D   D','DDDD '],
  'E' => ['EEEEE','E    ','E    ','EEEEE','E    ','E    ','EEEEE'],
  'F' => ['FFFFF','F    ','F    ','FFFFF','F    ','F    ','F    '],
  'G' => [' GGG ','G   G','G    ','G GGG','G   G','G   G',' GGG '],
  'H' => ['H   H','H   H','H   H','HHHHH','H   H','H   H','H   H'],
  'I' => ['IIIII','  I  ','  I  ','  I  ','  I  ','  I  ','IIIII'],
  'J' => ['JJJJJ','    J','    J','    J','    J','    J','JJJJ '],
  'K' => ['K   K','K  K ','K K  ','KK   ','K K  ','K  K ','K   K'],
  'L' => ['L    ','L    ','L    ','L    ','L    ','L    ','LLLLL'],
  'M' => ['M   M','MM MM','M M M','M   M','M   M','M   M','M   M'],
  'N' => ['N   N','NN  N','N   N','N N N','N   N','N  NN','N   N'],
  'O' => [' OOO ','O   O','O   O','O   O','O   O','O   O',' OOO '],
  'P' => ['PPPP ','P   P','P   P','PPPP ','P    ','P    ','P    '],
  'Q' => [' QQQ ','Q   Q','Q   Q','Q   Q','Q Q Q','Q  QQ',' QQQQ'],
  'R' => ['RRRR ','R   R','R   R','RRRR ','R R  ','R  R ','R   R'],
  'S' => [' SSS ','S   S','S    ',' SSS ','    S','S   S',' SSS '],
  'T' => ['TTTTT','  T  ','  T  ','  T  ','  T  ','  T  ','  T  '],
  'U' => ['U   U','U   U','U   U','U   U','U   U','U   U',' UUU '],
  'V' => ['V   V','V   V','V   V','V   V','V   V',' V V ','  V  '],
  'W' => ['W   W','W   W','W   W','W W W','W W W','W W W',' W W '],
  'X' => ['X   X','X   X',' X X ','  X  ',' X X ','X   X','X   X'],
  'Y' => ['Y   Y','Y   Y',' Y Y ','  Y  ','  Y  ','  Y  ','  Y  '],
  'Z' => ['ZZZZZ','    Z','   Z ','  Z  ',' Z   ','Z    ','ZZZZZ']
}

def block_print(string)
  str = string.strip.upcase
  return str if str == ''
  arr = str.chars.map{|c| $lets[c]}
  arr[0].zip(*arr[1..-1]).map{|a| a.join(' ').rstrip}.join("\n")
end
