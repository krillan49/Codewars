#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your task is to create a Funnel data structure. It consists of three basic methods: fill(), drip() and toString()/to_s/__str__. Its maximum capacity is 15 data.
#
# Data should be arranged in an inverted triangle, like this:
#
# \1 2 3 4 5/
#  \7 8 9 0/
#   \4 5 6/
#    \2 3/
#     \1/
# The string method should return a multi-line string to display current funnel data arrangement:
#
# funnel = Funnel.new
# print funnel.to_s
#  \         /
#   \       /
#    \     /
#     \   /
#      \ /
# The method fill() should accept one or more arguments to fill in the funnel:
#
#  funnel = Funnel.new
#  funnel.fill(1)
#  print funnel.to_s
#   \         /
#    \       /
#     \     /
#      \   /
#       \1/
#  funnel.fill(2)
#  print funnel.to_s
#   \         /
#    \       /
#     \     /
#      \2  /
#       \1/
#  funnel.fill(3)
#  print funnel.to_s
#   \         /
#    \       /
#     \     /
#      \2 3/
#       \1/
#  funnel.fill(4,5)
#  print funnel.to_s
#   \         /
#    \       /
#     \4 5  /
#      \2 3/
#       \1/
#  funnel.fill(6,7,8,9)
#  print funnel.to_s
#   \         /
#    \7 8 9  /
#     \4 5 6/
#      \2 3/
#       \1/
# In each row, fill() always fill data from left to right.
#
# The method drip() should drip the bottom value out of funnel and returns this value:
#
# (continue the example above)
# v = funnel.drip()
# puts v
# 1
# print funnel.to_s
#  \         /
#   \  8 9  /
#    \7 5 6/
#     \4 3/
#      \2/
# As you can see, the bottom 1 was dripping out. The number above it will fill it's place. The rules to fill are: Select one of the two numbers above it, which bear the "weight" of relatively large. In other words, there are more numbers on this number. Is this a bit hard to understand? Please see the following:
#
#  In the example above, before the execution of drip(), funnel is:
#   \         /
#    \7 8 9  /
#     \4 5 6/
#      \2 3/
#       \1/
# After drip(), 1 will be dripped out.
# We should choose a number between 2 and 3 to fill the place of 1.
# 2 has 5 numbers on it(4,5,7,8,9). 3 has 4 numbers on it(5,6,8,9)
# So we choose 2 to fill the place of 1
# And now, the place of 2 is empty.
# We also need choose a number between 4 and 5 to fill the place of 2.
# 4 has 2 numbers on it(7,8). 5 has 2 numbers on it too(8,9)
# There are same "weight" on 4 and 5,
# In this case, we choose the number on the left
# So we choose 4 to fill the place of 2
# And then choose 7 to fill the place of 4
# Let us continue to drip():
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \    9  /
#    \7 8 6/
#     \5 3/
#      \4/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \7 9 6/
#     \8 3/
#      \5/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \  9 6/
#     \7 3/
#      \8/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \    6/
#     \7 9/
#      \3/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \     /
#     \7 6/
#      \9/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \     /
#     \  6/
#      \7/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \     /
#     \   /
#      \6/
#
# funnel.drip
# print funnel.to_s
#  \         /
#   \       /
#    \     /
#     \   /
#      \ /
# When the funnel is empty, drip() will return null/nil/None
#
# v= funnel.drip
# puts v
# nil
# print funnel.to_s
#  \         /
#   \       /
#    \     /
#     \   /
#      \ /
# v= funnel.drip()
# print(v)
# None
# print(funnel)
#  \         /
#   \       /
#    \     /
#     \   /
#      \ /
# Another edge case is: When funnel is full, fill() will not change the funnel.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Funnel
  def initialize
    @funnel = (1..5).map{|n| Array.new(n)}.reverse
  end

  def fill(*args)
    fun = @funnel.reverse
    @funnel = fun.each.with_index{|arr, i| arr.each.with_index{|e,j| fun[i][j] = args.shift if !e}}.reverse
  end

  def drip
    fun = @funnel.map.with_index{|a, i| a.map.with_index{|e, j| [j, e, i+j*2]}}.reverse
    res, n, j = nil, nil, nil
    fun.each.with_index do |arr, i|
      if i == 0
        res = fun[0][0][1]
        fun[0][0][1] = nil
        j = fun[0][0][0]
        n = fun[0][0][2]
      else
        new = arr.select{|a| a[1] != nil && (a[2] - n).abs == 1}
        if i != fun.size-1
          ninds = new.map.with_index do |nw, ni|
            size = fun[i+1..-1].map.with_index(1){|ar, k|
              ar.select{|a| (nw[2]-k..nw[2]+k).include?(a[2])}.map{|e| e[1]}.compact
            }.flatten.size
            [size, ni]
          end
          new = ninds == [] || ninds.map(&:first).uniq.size == 1 ? new.sort_by(&:first)[0] : new[ninds.sort_by(&:first)[-1][-1]]
        else
          new = new.sort_by(&:first)[0]
        end
        if new
          x = new[1]
          fun[i][new[0]][1] = nil
          fun[i-1][j][1] = x
          j = fun[i][new[0]][0]
          n = fun[i][j][2]
        end
      end
    end
    @funnel = fun.reverse.map{|arr| arr.map{|a| a[1]}}
    res
  end

  def to_s
    @funnel.map.with_index{|a, i| ' ' * i + "\\" + a.map{|e| e == nil ? ' ' : e}.join(' ') + '/'}.join("\n")
  end
end
