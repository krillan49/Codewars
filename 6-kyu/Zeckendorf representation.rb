#===============================================================================================================
#                                               Description
#===============================================================================================================

# Every positive integer can be written as a sum of Fibonacci numbers. For example 10 = 8 + 2 or 5 + 3 + 2 or 3 + 3 + 2 + 2. Apparently, this representation is not unique.
#
# It becomes unique, if we rule out consecutive Fibonacci numbers: this is Zeckendorf's theorem, first proven by Lekkerkerker in 1952. In the example above, this excludes the last two representations (containing the consecutive Fibonacci numbers 2 and 3), and we are left with the Zeckendorf representation 10 = 8 + 2.
#
# Complete the function that returns the Zeckendorf representation of a given integer n as a list of Fibonacci numbers in decreasing order. Return an empty list for n = 0 and None/nil for negative n.
#
# Hint: Be greedy!
#
# Footnote: The Zeckendorf representation is closely connected to the Fibonacci coding.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

FIB = [1, 1]

def zeckendorf(n)
  return nil if n < 0
  return [] if n == 0
  until FIB.last(2).sum > n
    FIB << FIB.last(2).sum
  end
  return [n] if FIB.include?(n)
  fib = FIB.select{|e| e < n}
  res = []
  until res.sum == n || fib == []
    res << fib.delete(fib.max)
    k = n - res.sum
    fib.select!{|e| e <= k}
  end
  res
end
