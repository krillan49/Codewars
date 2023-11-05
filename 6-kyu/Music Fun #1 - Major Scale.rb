#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your music theory class just gave you a homework where you have to find the keys for a bunch of melodies. You decided to be lazy and create a key detection program to do the work for you.
#
# Each melody in this assignment is supposed to be strictly derived from a major scale. There are twelve major scales each of which starts from a differnt one of the twelve musical notes. The twelve musical notes are, in ascending order:
#
# C, C#, D, D#, E, F, F#, G, G#, A, A#, B
#
# (For simplicity, we only use sharps( # ) and not flats( b ))
#
# A major scale has seven unique notes and follows a specific intervalic pattern. For instance, the ascending C major scale with notes C,D,E,F,G,A and B follows this pattern:
#
# Notes       C - D - E - F - G - A - B - C
# Distance      2   2   1   2   2   2   1
# The number indicated below each set of two notes shows the distance of the two notes. Between C and D, you have distance of 2 because you skip C#, but between E and F the distance is only 1.
#
# The same pattern (2-2-1-2-2-2-1) occurs in every major scale. E major scale, which starts on the note E, goes:
#
# Notes       E - F# - G# - A - B - C# - D# - E
# Distance      2    2    1   2   2    2    1
# Your task is to create a function that takes a melody as a string and if the melody uses all the seven notes of a major scale, but no other notes, returns a string:
#
# "? major scale"
#
# Where ? is the starting note of the scale (or the "key center"). For instance, the input melody "C#D#FF#D#FF#G#A#C" returns "C# major scale".
#
# Beware! A melody doesn't always start on the first note of a scale. For example, "D#BC#ABG#AF#E" should return "E major scale".
#
# If the melody is not derived from any of the major scales, return:
#
# "No major scale"
#
# Note:
#
# - Input contains only -> 'C','D','E','F','G','A','B', or '#' (no lower case)
# - No other letters, space, number or special characters are included
# - Even if a melody misses only one note from a scale, return "No major scale"(for instance, "CDEFGA" is not a complete C major scale)
# - Note names E# and B# are invalid, and input with these should return "No major scale"
# - Also invalid to have two sharps in a row (##), if this happens return "No major scale"
# Also invalid to have two sharps in a row (##), if this happens, return "No major scale"
# Input string that starts with a sharp should also return "No major scale"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

MS = (0..11).map{|n| ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'].rotate(n)}

def major_scale(melody)
  return 'No major scale' if melody[0] == '#' || %w[E# B# ##].any?{|e| melody.include?(e)}
  melody = melody.chars.slice_when{|a, b| /[A-Z]/ === b}.map(&:join).uniq
  return 'No major scale' if melody.size != 7
  MS.each do |pat|
    mel = melody.sort_by{|e| pat.index(e) }
    dop = MS.map{|pp| pp.index(mel[0]) - pp.index(mel[-1])}.tally.max_by{|k, v| v}[0]
    nums = mel.each_cons(2).map{|a, b| pat.index(b) - pat.index(a)}
    return "#{pat[0]} major scale" if nums + [dop] == [2,2,1,2,2,2,1]
  end
  'No major scale'
end
