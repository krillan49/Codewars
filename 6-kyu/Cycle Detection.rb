#===============================================================================================================
#                                               Description
#===============================================================================================================

# https://www.codewars.com/kata/5416f1834c24604c46000696

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def cycle(seq)
  x = nil
  seq.each_with_index{|n, i| i == 0 || !seq[0...i].include?(n) ? x = n : (return [seq.index(n), i-seq.index(n)]) }
  []
end
