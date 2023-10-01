#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a non-negative number, return the next bigger polydivisible number, or an empty value like null or Nothing.
#
# A number is polydivisible if its first digit is cleanly divisible by 1, its first two digits by 2, its first three by 3, and so on. There are finitely many polydivisible numbers.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

POLS=[[0], [1,2,3,4,5,6,7,8,9]]

def next_num(n)
  return nil if n >= 3608528850368400786036725
  size = POLS.size
  until POLS[-1][-1] > n
    newpols = []
    POLS[-1].each do |pn|
      (0..9).each do |d|
        newpn = "#{pn}#{d}".to_i
        newpols << newpn if newpn % size == 0
      end
    end
    POLS << newpols
    size += 1
  end
  POLS[n.to_s.size..-1].flatten.find{|res| res > n}
end
