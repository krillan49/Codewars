#===============================================================================================================
#                                               Description
#===============================================================================================================

# (First in this series: http://www.codewars.com/kata/musical-pitch-classes)
#
# This kata is the inverse of the previous one: you must write a method to_pitch_class that, when given an integer representing a musical pitch class, returns an array of every name for that note.
#
# There are only twelve pitch classes (which are cyclical, e.g., the note above number 11 is number 0), and the numerical values of the natural notes are as follows:
#
# C: 0, D: 2, E: 4, F: 5, G: 7, A: 9, B: 11
#
# A sharp ("♯") raises a note by one, and a flat ("♭") lowers it by one. For this kata, we'll also be using the double sharp and the double flat, which are exactly what they sound like: the double sharp raises a pitch by two, and the double flat lowers a pitch by two. Since Codewars doesn't allow the characters for sharp, flat, double sharp, and double flat, we'll use the strings "#", "b", "x", and "bb" instead.
#
# Some examples:
#
# to_pitch_class(2) # - > should return ['D', 'Cx', 'Ebb']
#
# to_pitch_class(10) # -> should return ['A#', 'Bb', 'Cbb']
# The order of the returned array doesn't matter.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

N = {'C'=>0, 'D'=>2, 'E'=>4, 'F'=>5, 'G'=>7, 'A'=>9, 'B'=>11, '#'=>1, 'b'=>-1, 'x'=>2, 'bb'=>-2}

def to_pitch_class n
  mix = %w[C D E F G A B].product(%w[# b x bb])
  .map{|a, b| [N[a] + N[b] + (N[a] + N[b] > 11 ? -12 : N[a] + N[b] < 0 ? 12 : 0), a + b]}
  (mix + %w[C D E F G A B].map{|e| [N[e], e]}).select{|a| a[0] == n}.map{|a| a[1]}
end
