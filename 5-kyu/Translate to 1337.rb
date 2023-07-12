#===============================================================================================================
#                                               Description
#===============================================================================================================

# An angry wizard cast a spell on your friend. Your buddeh can now only speak in gibberish. However, after tracking down the wizard, you've found his translation scroll below.
#
# There are four conditions:
# You must not repeat the same key consecutively if there are more than one(the order of keys in the scroll is important!).
# Ex: to_leet('aaaa') # => '4@4@'
# The input will consist only of lowercase alphabetical characters(a-z) and single spaces.
# Ex: to_leet('a a a a a a a') # => '4 @ 4 @ 4 @ 4'
# If a key does not exist for a character, keep the character as is('m' is one such character without a key)
# Ex: to_leet('mama') # => 'm4m@'
# The strings must represent the key(s) on the scroll, meaning that certain characters might have to be escaped.
# The Scroll
#   a = ['4', '@']
#   b = ['|3', '8']
#   d = ['|)', 'o|']
#   e = ['3']
#   f = ['|=']
#   g = ['9', '6']
#   h = ['|-|', ']-[', '}-{', '(-)', ')-(', '#']
#   i = ['1', '!', '][']
#   j = ['_|']
#   k = ['|<', '|{']
#   l = ['|_']
#   n = ['|\|']
#   o = ['0']
#   p = ['|2', '|D']
#   q = ['(,)']
#   r = ['|Z', '|?']
#   s = ['5', '$']
#   t = ['+', '7']
#   v = ['|/', '\/']
#   w = ['\^/', '//']
#   x = ['><', '}{']
#   y = ['`/']
#   z = ['(\)']

#===============================================================================================================
#                                               Solution
#===============================================================================================================

ABC = {
  'a'=>['4', '@'], 'b'=>['|3', '8'], 'd'=>['|)', 'o|'], 'e'=>['3'], 'f'=>['|='], 'g'=>['9', '6'],
  'h'=>['|-|', ']-[', '}-{', '(-)', ')-(', '#'], 'i'=>['1', '!', ']['], 'j'=>['_|'], 'k'=>['|<', '|{'],
  'l'=>['|_'], 'n'=>['|\|'], 'o'=>['0'], 'p'=>['|2', '|D'], 'q'=>['(,)'], 'r'=>['|Z', '|?'], 's'=>['5', '$'],
  't'=>['+', '7'], 'v'=>['|/', '\/'], 'w'=>['\^/', '//'], 'x'=>['><', '}{'], 'y'=>['`/'], 'z'=>['(\)']
}

def to_leet(w)
  abc = ABC.clone
  w.chars.map do |c|
    if abc[c]
      abc[c] = abc[c].rotate
      abc[c][-1]
    else
      c
    end
  end.join
end
