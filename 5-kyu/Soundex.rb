#===============================================================================================================
#                                               Description
#===============================================================================================================

# Soundex is an interesting phonetic algorithm developed nearly 100 years ago for indexing names as they are pronounced in English. The goal is for homophones to be encoded to the same representation so that they can be matched despite minor differences in spelling.
#
# Reference: https://en.wikipedia.org/wiki/Soundex
#
# Preface
# I first read about Soundex over 30 years ago. At the time it seemed to me almost like A.I. that you could just type in somebody's name the way it sounded and there was still a pretty good chance it could match the correct person record. That was about the same year as the first "Terminator" movie so it was easy for me to put 2 and 2 together and conclude that Arnie must have had some kind of futuristic Soundex chip in his titanium skull helping him to locate Serah Coner... or was it Sarh Connor... or maybe Sayra Cunnarr...
#
# :-)
#
# Task
# In this Kata you will encode strings using a Soundex variation called "American Soundex" using the following (case insensitive) steps:
#
# Save the first letter. Remove all occurrences of h and w except first letter.
# Replace all consonants (include the first letter) with digits as follows:
# b, f, p, v = 1
# c, g, j, k, q, s, x, z = 2
# d, t = 3
# l = 4
# m, n = 5
# r = 6
# Replace all adjacent same digits with one digit.
# Remove all occurrences of a, e, i, o, u, y except first letter.
# If first symbol is a digit replace it with letter saved on step 1.
# Append 3 zeros if result contains less than 3 digits. Remove all except first letter and 3 digits after it
# Input
# A space separated string of one or more names. E.g.
#
# Sarah Connor
#
# Output
# Space separated string of equivalent Soundex codes (the first character of each code must be uppercase). E.g.
#
# S600 C560

#===============================================================================================================
#                                               Solution
#===============================================================================================================

LET = {
  'b'=>'1', 'f'=>'1', 'p'=>'1', 'v'=>'1',
  'c'=>'2', 'g'=>'2', 'j'=>'2', 'k'=>'2', 'q'=>'2', 's'=>'2', 'x'=>'2', 'z'=>'2',
  'd'=>'3', 't'=>'3',
  'l'=>'4',
  'm'=>'5', 'n'=>'5',
  'r'=>'6'
}

def soundex(names)
	names.split.map do |n|
    first = n[0]
    n = n[0] + n[1..-1].tr('hwHW', '')
    n = n.chars.map{|c| LET[c.downcase] ? LET[c.downcase] : c}.join.squeeze('0-9')
    n = n[0] + n[1..-1].gsub(/[aeiouy]/i, '')
    n[0] = first if /[0-9]/ === n[0]
    n += '000' if n.chars.count{|e| /[0-9]/ === e} < 3
    n[0..3]
  end
  .join(' ').upcase
end
