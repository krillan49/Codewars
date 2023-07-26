#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a function that takes an integer n and returns the nth iteration of the fractal known as Sierpinski's Gasket.
#
# Here are the first few iterations. The fractal is composed entirely of L and white-space characters; each character has one space between it and the next (or a newline).
#
# 0
# L
# 1
# L
# L L
# 2
# L
# L L
# L   L
# L L L L
# 3
# L
# L L
# L   L
# L L L L
# L       L
# L L     L L
# L   L   L   L
# L L L L L L L L

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sierpinski(n)
  s = ['L   ', 'L L ']
  return s[0..n].map(&:strip).join("\n") if n < 2
  (n-1).times do
    s += s.zip(s).map(&:join)
    s = s.flatten.map{|l| l.size < s[-1].size ? l + ' ' * (s[-1].size - l.size) : l}
  end
  s.map(&:strip).join("\n")
end
