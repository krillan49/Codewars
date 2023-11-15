#===============================================================================================================
#                                               Description
#===============================================================================================================

# Check if given chord is minor or major.
#
# Rules
# Basic minor/major chord have three elements.
# A chord is minor when the interval between first and second element = 3 and between second and third = 4
# A chord is major when the interval between first and second element = 4 and between second and third = 3
# In a minor/major chord the interval between first and third element is always = 7
# There is a preloaded list of the 12 notes of a chromatic scale built on C. This means that there are (almost) all allowed note' s names in music:
#
# ['C', ['C#', 'Db'], 'D', ['D#', 'Eb'], 'E', 'F', ['F#', 'Gb'], 'G', ['G#', 'Ab'], 'A', ['A#', 'Bb'], 'B']
# Note that e.g. 'C#' - 'C' = 1, 'C' - 'C#' = 1, 'Db' - 'C' = 1 and 'B' - 'C' = 1.
#
# Input: String of notes separated by whitespace, e. g. 'A C# E'
#
# Output: String message: 'Minor', 'Major' or 'Not a chord'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

N = {
  'C'=>1, 'C#'=>2, 'Db'=>2, 'D'=>3, 'D#'=>4, 'Eb'=>4, 'E'=>5, 'F'=>6, 'F#'=>7,
  'Gb'=>7, 'G'=>8, 'G#'=>9, 'Ab'=>9, 'A'=>10, 'A#'=>11, 'Bb'=>11, 'B'=>12
}

def minor_or_major(chord)
  arr = chord.split.map{|n| N[n]}.compact
  return 'Not a chord' if arr.size != 3
  res = arr.each_cons(2).map{|a, b| a <= b ? b - a : 12 + b - a}
  res == [4, 3] ? 'Major' : res == [3, 4] ? 'Minor' : 'Not a chord'
end
