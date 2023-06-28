#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a certain array of positive and negative numbers, give the longest increasing or decreasing combination of at least 3 elements of the array.
#
# If our array is a = [a[0], a[1], ....a[n-1]]:
#
# i) For the increasing case: there is a combination: a[i] < a[j] < a[k]..< a[p], such that 0 ≤ i < j < k < ...< p ≤ n - 1
#
# For the decreasing case the combination would be: a[i] > a[j] > a[k]..> a[p], such that 0 ≤ i < j < k < ...< p ≤ n - 1
#
# For that task create a function longest_comb() (Javascript: longestComb() ) that will receive an array, and a command, one of the two kinds of strings: '< <' or '<<' (increasing), '> >' or '>>' (decreasing).
#
# Let's see some examples:
#
# longest_comb([-1, 3, -34, 18, -55, 60, 118, -64], '< <') == [-1, 3, 18, 60, 118]
#
# longest_comb([-1, 3, -34, 18, -55, 60, 118, -64], '> >') == [[-1, -34, -55, -64], [3, -34, -55, -64]] # outputs a 2D array of two combinations # of same length in the order that they appear in the given array from # left to right
# We may have some cases without any possible combination:
#
# longest_comb([-26, 26, -36, 17, 12, 12, -10, -21], "< <") == []
# On the other hand we may have cases with many solutions:
#
# longest_comb([-22, 40, -45, -43, -1, 7, 43, -56], "> >") == [[-22, -45, -56], [-22, -43, -56], [40, -45, -56], [40, -43, -56], [40, -1, -56], [40, 7, -56]]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def longest_comb(arr, command)
  command = command.tr(' ','')
  res = []
  k = 3
  arr.each.with_index do |n, i|
    brr = [n] + (command == '>>' ? arr[i..-1].select{|e| e < n} : arr[i..-1].select{|e| e > n})
    if brr.size >= k
      brr.size.downto(k) do |m|
        sign = command == '>>' ? '>' : '<'
        crr = brr.combination(m).select{|a| a.each_cons(2).all?{|x, y| x.send(sign, y)}}
        if crr.size > 0 && crr[0].size > k
          res = crr
          k = crr[0].size
          break
        else
          res += crr
        end
      end
    end
  end
  res.size == 1 ? res.flatten : res
end
