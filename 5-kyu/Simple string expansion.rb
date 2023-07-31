#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider the following expansion:
#
# solve("3(ab)") = "ababab"     -- because "ab" repeats 3 times
# solve("2(a3(b))") = "abbbabbb" -- because "a3(b)" == "abbb", which repeats twice.
# Given a string, return the expansion of that string.
#
# Input will consist of only lowercase letters and numbers (1 to 9) in valid parenthesis. There will be no letters or numbers after the last closing parenthesis

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve(st)
  a = st.tr('(', ' ').tr(')', '').split
  until a.size == 1
    r = a[-2].chars.slice_when{|a, b| /\D/ === a && /\d/ === b}.map{|a| /\d/ === a.join ? a.join.to_i : a.join}
    a = a[0..-3] << (r.size == 2 ? r[0] + a[-1] * r[1] : r[0].class == Integer ? a[-1] * r[0] : r[0] + a[-1])
  end
  a.join
end
