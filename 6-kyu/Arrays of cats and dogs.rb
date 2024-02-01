#===============================================================================================================
#                                               Description
#===============================================================================================================

# Consider an array containing cats and dogs. Each dog can catch only one cat, but cannot catch a cat that is more than n elements away. Your task will be to return the maximum number of cats that can be caught.
#
# For example:
#
# solve(['D','C','C','D','C'], 2) = 2, because the dog at index 0 (D0) catches C1 and D3 catches C4.
# solve(['C','C','D','D','C','D'], 2) = 3, because D2 catches C0, D3 catches C1 and D5 catches C4.
# solve(['C','C','D','D','C','D'], 1) = 2, because D2 catches C1, D3 catches C4. C0 cannot be caught because n == 1.
# solve(['D','C','D','D','C'], 1) = 2, too many dogs, so all cats get caught!
# Do not modify the input array.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve(arr, n)
  ar = arr.map.with_index{|e, i| [e, i]}
  c = ar.select{|a| a[0] == 'C'}.map{|a| a[1]}
  d = ar.select{|a| a[0]=='D'}
  counter = 0
  c.each do |cat|
    dog = d.find{|m| m[0] == 'D' && (m[1]-n..m[1]+n).include?(cat)}
    if dog
      counter += 1
      d[d.index(dog)] = ['X', 0]
    end
  end
  counter
end
