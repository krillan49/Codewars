#===============================================================================================================
#                                               Description
#===============================================================================================================

# Mad Libs is a game where you switch out words in a sentence.
#
# For this kata, you will create a method madlib(name) for String objects that replaces every 3rd person singular pronoun (case insensitive) with name.
#
# The pronouns are:
#
# He
# She
# It
# Her
# Him
# For example:
#
# "He is short".madlib("Bob")
# => "Bob is short"
#
# "I gave it a round of applause".madlib("the show")
# => "I gave the show a round of applause"
#
# "I high-fived her".madlib("your mom")
# => "I high-fived your mom"
#
# "It fell on it's face".madlib("chuck Norris")
# => "Chuck Norris fell on chuck Norris's face"
# Notes:
#
# The first character of the resulting string should be capitalized.
# Do not mutate the original object, return a fresh one.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class String
  def madlib(n)
    return '' if self == ''
    new = self.chars.slice_when{|a, b| /[^a-z]/i === a or /[^a-z]/i === b}.map do |a|
      %w[her she it he him].include?(a.join.downcase) ? n : a.join
    end.join
    new[0].upcase + new[1..-1]
  end
end
