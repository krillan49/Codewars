#===============================================================================================================
#                                               Description
#===============================================================================================================

# Use the characters " " and "█" to draw the nth iteration of the Sierpiński carpet. In the following you are given the first three iterations. Implement sierpinski_carpet_string(n) which returns the Sierpiński carpet as string for n iterations.
#
# n = 0:
# ██
#
# n = 1:
# ██████
# ██░░██
# ██████
#
# n = 2:
# ██████████████████
# ██░░████░░████░░██
# ██████████████████
# ██████░░░░░░██████
# ██░░██░░░░░░██░░██
# ██████░░░░░░██████
# ██████████████████
# ██░░████░░████░░██
# ██████████████████
#
# Note
# Every line but the last ends with \n
# Your solution must be under 4000 chars to avoid hardcoding solutions.
# Don't let this mislead you: ░ is only used to visualize space   above and in the test cases. Use space  . This is done since space is sometimes not displayed with a full length in Markdown which makes everything look bad.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sierpinski_carpet_string(n)
  return '██' if n == 0
  s = ['██']
  n.times do
    h = s.map{|w| w.tr('█', ' ')}
    s = s.zip(s, s).map(&:join) + s.zip(h, s).map(&:join) + s.zip(s, s).map(&:join)
  end
  s.join("\n")
end
