#===============================================================================================================
#                                               Description
#===============================================================================================================

# Kontti language is a finnish word play game.
#
# You add -kontti to the end of each word and then swap their characters until and including the first vowel ("aeiouy");
#
# For example the word tame becomes kome-tantti; fruity becomes koity-fruntti and so on.
#
# If no vowel is present, the word stays the same.
#
# Write a string method that turns a sentence into kontti language!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class String
  def kontti
    split.map do |w|
      i = w.index(/[aeiouy]/i)
      i ? 'ko' + w[i+1..-1] + '-' + w[0..i] + 'ntti' : w
    end
    .join(' ')
  end
end
