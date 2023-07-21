#===============================================================================================================
#                                               Description
#===============================================================================================================

# There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.
#
# Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.
#
# In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically
#
# Requirement
# return a string where:
#
# the first and last characters remain in original place for each word
# characters between the first and last characters must be sorted alphabetically
# punctuation should remain at the same place as it started, for example: shan't -> sahn't
# Assumptions
#
# words are seperated by single spaces
# only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
# special characters do not take the position of the non special characters, for example: -dcba -> -dbca
# for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
# ignore capitalisation
# for reference: http://en.wikipedia.org/wiki/Typoglycemia

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def scramble_words(words)
  return words if words.size < 4
  words.split.map do |w|
    a = w.chars.map{|c| ['-', "'", ',', '.'].include?(c) ? c : nil}
    b = w.chars.select{|c| /[a-z]/ === c}
    b = [b[0]] + b[1..-2].sort + [b[-1]]
    a.each.with_index{|e, i| a[i] = b.shift if !e}
  end
  .map(&:join).join(' ')
end
