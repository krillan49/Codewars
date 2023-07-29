#===============================================================================================================
#                                               Description
#===============================================================================================================

# A bird flying high above a mountain range is able to estimate the height of the highest peak.
#
# Can you?
#
# Example
# The birds-eye view
# ^^^^^^
#  ^^^^^^^^
#   ^^^^^^^
#   ^^^^^
#   ^^^^^^^^^^^
#   ^^^^^^
#   ^^^^
# The bird-brain calculations
# 111111
#  1^^^^111
#   1^^^^11
#   1^^^1
#   1^^^^111111
#   1^^^11
#   1111
# 111111
#  12222111
#   12^^211
#   12^21
#   12^^2111111
#   122211
#   1111
# 111111
#  12222111
#   1233211
#   12321
#   12332111111
#   122211
#   1111
# Height = 3

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def peak_height(mountain)
  m = mountain.map{|s| s.chars.map{|e| e == '^' ? e : 0}}
  if m.flatten.all?{|e| e == '^'}
    l = [m.size, m[0].size].min
    return l.odd? ? l / 2 + 1 : l / 2
  end
  counter, n = 0, 0
  until m.flatten.all?{|e| e.class == Integer}
    m.each.with_index do |a, i|
      a.each.with_index do |e, j|
        m[i][j] = n + 1 if e == '^' &&
        ((j == a.size-1 or j == 0 or i == m.size-1 or i == 0) || ([a[j+1], a[j-1], m[i+1][j], m[i-1][j]].any?{|e| e == n}))
      end
    end
    counter += 1
    n += 1
  end
  counter
end
