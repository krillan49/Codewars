#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write
#
# function wordStep(str)
# that takes in a string and creates a step with that word.
#
# E.g
#
# wordStep('SNAKES SHOE EFFORT TRUMP POTATO') ===
#
# [['S','N','A','K','E','S',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ','H',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ','O',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ','E','F','F','O','R','T',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','R',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','U',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','M',' ',' ',' ',' ',' '],
#  [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','P','O','T','A','T','O']]
# Every word will end with the character that the next word will start with. You will start top left of the array and end bottom right. All cells that are not occupied by a letter needs to be a space ' '

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def word_step(str)
  a = str.split
  m = a.map.with_index{|w, i| i.odd? && i != a.size-1 ? w[1..-2] : i.odd? ? w[1..-1] : w}
  n = 0
  m.each.with_index do |w, i|
    if i.even?
      m[i] = [[w, n, w.size + n - 1]]
      n = w.size + n - 1
    else
      m[i] = w.chars.map{|c| [c, n, n]}
    end
  end
  l = m.flatten(1)[-1][-1]
  m.flatten(1).map{|a| [' '] * a[1] + a[0].chars + [' '] * (l - a[2])}
end
