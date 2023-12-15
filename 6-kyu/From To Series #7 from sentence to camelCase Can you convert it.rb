#===============================================================================================================
#                                               Description
#===============================================================================================================

# Give you a sentence s. It contains some words and separated by spaces. Another arguments is n, its a number(1,2 or 3). You should convert s to camelCase n.
#
# There are three kinds of camelCase:
#
# camelCase 1: The first letter of each word should be capitalized.
#               Except for the first word.
#
# Example: "Hello world"  -->  "helloWorld"
#
# camelCase 2: The last letter of each word should be capitalized.
#               Except for the last word.
#
# Example: "Hello world"  -->  "hellOworld"
#
# camelCase 3: The first and last letters of each word should be capitalized.
#               Except for the first and lasts letter of sentence.
#
# Example: "Hello world"  -->  "hellOWorld"
# You can assume that all of the input data is valid. That is: s always be a string; It contains at least two words; Each word contains only letters(a-zA-Z); Each word contains ar least three letters; n always be 1,2 or 3.
#
# Examples
# toCamelCase("hello world",1) === "helloWorld"
# toCamelCase("hello world",2) === "hellOworld"
# toCamelCase("hello world",3) === "hellOWorld"
#
# toCamelCase("Hello world",1) === "helloWorld"
#
# toCamelCase("Each number plus one",1) === "eachNumberPlusOne"
# toCamelCase("Each number plus one",2) === "eacHnumbeRpluSone"
# toCamelCase("Each number plus one",3) === "eacHNumbeRPluSOne"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def to_camelcase(s,n)
  s = s.downcase
  s.split.map.with_index do |w, i|
    if n == 1
      i != 0 ? w.capitalize : w
    elsif n == 2
      i != s.split.size - 1 ? w[0..-2] + w[-1].upcase : w
    elsif n == 3
      i == 0 ? w[0..-2] + w[-1].upcase : i == s.split.size-1 ? w.capitalize : w[0..-2].capitalize + w[-1].upcase
    end
  end.join
end
