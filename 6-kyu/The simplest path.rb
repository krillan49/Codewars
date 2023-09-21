#===============================================================================================================
#                                               Description
#===============================================================================================================

# Story
# John found a path to a treasure, and while searching for its precise location he wrote a list of directions using symbols "^", "v", "<", ">" which mean north, east, west, and east accordingly. On his way John had to try many different paths, sometimes walking in circles, and even missing the treasure completely before finally noticing it.
#
# Task
# Simplify the list of directions written by John by eliminating any loops.
#
# Note: a loop is any sublist of directions which leads John to the coordinate he had already visited.
#
# Examples
# simplify("<>>")        ==  ">"
# simplify("<^^>v<^^^")  ==  "<^^^^"
# simplify("")           ==  ""
# simplify("^<<v")       ==  "^<<v"
# Simplification explanation
# Let's say John starts at point A and goes to point B.
# On his way he passes point C.
# Later he returns to point B (remember that John may be going in circles sometimes).
# The sublist of directions between the first and second visits of point B SHOULD BE REMOVED, as John doesn't progress by following those.
# He starts walking around again, and passes through point C.
# These directions SHOULD NOT BE REMOVED because after simplifying his path he arrives at point C for the first time! (Remember that John doesn't follow the directions he simplifies, so visiting it for the "first time" is hypothetical path, and visiting it for the "second time" is his real path; when hypothetical and real paths intersect, we ignore this fact.)
# Example
#     > > v
#     ^   v
# > > C > D > >
# ^   ^   v
# ^ < B < <
#     ^
#     A
# John visits points A -> B -> C -> D -> B -> C -> D, realizes that -> C -> D -> B steps are meaningless and removes them, getting this path: A -> B -> (*removed*) -> C -> D.
#
#     ∙ ∙ ∙
#     ∙   ∙
# > > C > D > >
# ^   ∙   ∙
# ^ < B ∙ ∙
#     ^
#     A
# Following the final, simplified route John visits points C and D, but for the first time, not the second (because we ignore the steps made on a hypothetical path), and he doesn't need to alter the directions list anymore.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def simplify(path)
  return '' if path == ''
  arr = path.chars
  y, x = 0, 0
  points = [[y, x]]
  arr.each do |e|
    y -= 1 if e == '^'
    y += 1 if e == 'v'
    x -= 1 if e == '<'
    x += 1 if e == '>'
    points << [y, x]
  end
  points.each.with_index{|e, i| (points[0...i].index(e)...i).each{|k| points[k] = nil} if i != 0 && points[0...i].include?(e) }
  points[1..-1].each_index{|i| path[i] = ' ' if !points[i]}
  path.tr(' ','')
end
