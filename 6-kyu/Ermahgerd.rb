#===============================================================================================================
#                                               Description
#===============================================================================================================

# Ermahgerd girl wants you to write a function that translates english into ermahgerd language!! There are many different subtleties to the translation but for this Kata we'll focus on just a few core ones:
#
# For this specific translation it's probably best to implement these features in the order below:
#
# Ermahgerd girl is ALWAYS very excited so everything needs to be in UPPERCASE!
#
# Each vowel should be replaced with: 'ER'
#
# Double "ER"s --->'ERER' and the letters 'ERH' should be replaced with just 'ER'
#
# The letters 'MY' (as a word or part of a word) should be replaced with: 'MAH'
#
# And to help with readability:
#
# Duplicate 'RR's should become a single 'R'
#
# After these steps are complete words longer than 4 letters that end in "ER" should have the "ER" trimmed off (the tricky bit is to make sure it can handle commas or spaces)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def ermahgerd(text)
  t = text.upcase.gsub(/MY/, 'mah').gsub(/[AEIOU]/, 'ER').gsub(/ERER|ERH/, 'ER').gsub(/RR/, 'R').upcase
  t.split.map do |w|
    if w.gsub(/[^A-Z]/, '').size > 4 && w.gsub(/[^A-Z]/, '')[-2..-1] == 'ER'
      w.chars.chunk_while{|a, b| /[A-Z]/ === b}.map.with_index{|a, i| i == 0 ? a[0..-3] : a}.join
    else
      w
    end
  end
  .join(' ')
end
