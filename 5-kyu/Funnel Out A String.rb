#===============================================================================================================
#                                               Description
#===============================================================================================================

# Imagine a funnel filled with letters. The bottom letter drops out of the funnel and onto a conveyor belt:
#
#   \b,c/  -->   \b,c/
#    \a/   -->    \ /
#                  a
# -------     -------
# If there are two letters above a gap, the smaller letter falls into the gap.
#
#   \b,c/   -->   \  c/
#    \ /    -->    \b/
# a            a
# -------      -------
# Of course, this can create a new gap, which must also be filled in the same way:
#
#   \f,e,d/  -->  \f, ,d/
#    \  c/   -->   \e,c/
#     \b/           \b/
#    a            a
#   -------      -------
# Once all the gaps above it have been filled, the bottom letter drops out of the funnel and onto the conveyorbelt. The process continues until all letters have fallen onto the conveyor. (New letters fall onto the end of the existing string)
#
# KATA GOAL: Return the string on the conveyorbelt after all letters have fallen.
#
# \f, ,d/      \f, ,d/   --> etc -->    \     /
#  \e,c/        \e,c/    --> etc -->     \   /
#   \b/    -->   \ /     --> etc -->      \ /
# a           a   b                   abcdef
# -------     -------                 -------
# All letters in the funnel will be unique i.e. in every comparison one letter will be strictly smaller than the other. The funnel will be presented as a nested list, e.g:
#
# [["d","a","c"],
#    ["b","e"],
#      ["f"]]
# The value of a letter is defined by its codepoint. Note: this means all capital letters are defined as smaller than all lower-case letters, but your language's comparison operator will probably treat it that way automatically.
#
# The funnels will always be "nice" -- every layer will have 1 item more than the layer below, and every layer will be full, and generally there's no funny business or surprises to consider. The only characters used are standard uppercase and lowercase letters A-Z and a-z. The tests go up to 9 layer funnel.
#
# Fully Worked Example
# \d,a,c/      \d,a,c/      \d,a,c/ -->  \d   c/
#  \b,e/        \b,e/  -->   \  e/  -->   \a,e/
#   \f/   -->    \ /   -->    \b/          \b/  -->
#                 f        f            f
# ------      -------      -------      -------
#
#
# \d   c/      \d   c/ -->  \    c/      \    c/
#  \a,e/  -->   \  e/  -->   \d,e/        \d,e/  -->
#   \ /   -->    \a/          \a/   -->    \ /   -->
# f  b        fb           fb           fb  a
# ------      -------      -------      -------
#
#
#  \    c/      \    c/      \    c/ -->  \     /
#   \  e/        \  e/  -->   \   /  -->   \  c/
#    \d/   -->    \ /   -->    \e/          \e/  -->
# fba          fba d       fbad          fbad
# -------      -------     --------      -------
#
#
#   \     /      \     /      \     /
#    \  c/  -->   \   /        \   /
#     \ /          \c/   -->    \ /
# fbad e       fbade        fbadec
# -------      -------      -------
#
# DONE. Return "fbadec".

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def funnel_out(funnel)
  fun = funnel.map.with_index{|a, i| a.map.with_index{|e, j| [j, e, i + j * 2]}}.reverse
  res = ''
  until fun.flatten(1).all?{|a| !a.any?{|e| /[a-z]/i === e}}
    n = nil
    j = nil
    fun.each.with_index do |arr, i|
      if i == 0
        res += fun[0][0][1]
        fun[0][0][1] = nil
        j = fun[0][0][0]
        n = fun[0][0][2]
      else
        new = arr.select{|a| a[1] && (a[2]-n).abs == 1}.sort_by{|a| a[1]}[0]
        if new
          l = new[1]
          fun[i][new[0]][1] = nil
          fun[i-1][j][1] = l
          j = fun[i][new[0]][0]
          n = fun[i][j][2]
        end
      end
    end
  end
  res
end
