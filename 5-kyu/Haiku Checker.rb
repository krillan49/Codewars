#===============================================================================================================
#                                               Description
#===============================================================================================================

# Haikus are short poems in a three-line format, with 17 syllables arranged in a 5–7–5 pattern. Your task is to check if the supplied text is a haiku or not.
#
# About syllables
# Syllables are the phonological building blocks of words. In this kata, a syllable is a part of a word including a vowel ("a-e-i-o-u-y") or a group of vowels (e.g. "ou", "ee", "ay"). A few examples: "tea", "can", "to·day", "week·end", "el·e·phant".
#
# However, silent "E"s do not create syllables. In this kata, an "E" is considered silent if it's alone at the end of the word, preceded by one (or more) consonant(s) and there is at least one other syllable in the word. Examples: "age", "ar·range", "con·crete"; but not in "she", "blue", "de·gree".
#
# Some more examples:
#
# one syllable words: "cat", "cool", "sprout", "like", "eye", "squeeze"
# two syllables words: "ac·count", "hon·est", "beau·ty", "a·live", "be·cause", "re·store"
# Examples
# An old silent pond...
# A frog jumps into the pond,
# splash! Silence again.
# ...should return True, as this is a valid 5–7–5 haiku:
#
# An old si·lent pond...            # 5 syllables
# A frog jumps in·to the pond,      # 7
# splash! Si·lence a·gain.          # 5
# Another example:
#
# Autumn moonlight -
# a worm digs silently
# into the chestnut.
# ...should return False, because the number of syllables per line is not correct:
#
# Au·tumn moon·light -          # 4 syllables
# a worm digs si·lent·ly        # 6
# in·to the chest·nut.          # 5

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def is_haiku?(text)
  arr = text.split("\n")
  return false if arr.size != 3
  arr.map{|s| s.tr('^a-zA-Z ', '').split}.map do |a|
    a.map do |w|
      w = w[0..-2] if /e/i === w[-1] && /[^aeiouy]/i === w[-2] && w[0..-3].chars.any?{|c| /[aeiouy]/i === c}
      w.chars.slice_when{|x, y| (/[aeiouy]/i === x && /[^aeiouy]/i === y) or (/[^aeiouy]/i === x && /[aeiouy]/i === y)}
      .count{|e| /[aeiouy]/i===e[0]}
    end.sum
  end == [5, 7, 5]
end
