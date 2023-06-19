#===============================================================================================================
#                                               Description
#===============================================================================================================

# A Hamming number is a positive integer of the form 2i3j5k, for some non-negative integers i, j, and k.
#
# Write a function that computes the nth smallest Hamming number.
#
# Specifically:
#
# The first smallest Hamming number is 1 = 203050
# The second smallest Hamming number is 2 = 213050
# The third smallest Hamming number is 3 = 203150
# The fourth smallest Hamming number is 4 = 223050
# The fifth smallest Hamming number is 5 = 203051
# The 20 smallest Hamming numbers are given in the Example test fixture.
#
# Your code should be able to compute the first 5 000 ( LC: 400, Clojure: 2 000, Haskell: 12 691, NASM, C, D, C++, Go and Rust: 13 282 ) Hamming numbers without timing out.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

HUM = [1]
$ukz = [0,0,0]

def hamming(n)
  until HUM.size >= n
    a, b, c = HUM[$ukz[0]] * 2, HUM[$ukz[1]] * 3, HUM[$ukz[2]] * 5
    if a == [a, b, c].min
      HUM << a if !HUM.include?(a)
      $ukz[0] += 1
    elsif b == [a, b, c].min
      HUM << b if !HUM.include?(b)
      $ukz[1] += 1
    elsif c == [a, b, c].min
      HUM << c if !HUM.include?(c)
      $ukz[2] += 1
    end
  end
  HUM[n - 1]
end
