#===============================================================================================================
#                                               Description
#===============================================================================================================

# We define the sequence SF in the following way in terms of four previous sequences: S1, S2, S3 and ST
#
# https://imgur.com/kCiwfWT
#
# We are interested in collecting the terms of SF that are multiple of ten.
#
# The first term multiple of ten of this sequence is 60
#
# Make the function find_mult10_SF() that you introduce the ordinal number of a term multiple of 10 of SF and gives us the value of this term.
#
# Let's see some cases:
#
# find_mult10_SF(1) == 60
#
# find_mult10_SF(2) == 70080
#
# find_mult10_SF(3) ==  90700800
# Memoization is advisable to have a more agile code for tests.
#
# Your code will be tested up to the 300-th term, multiple of 10.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

ST, K, SF = [8], [1], []

def find_mult10_SF(n)
  until SF.size >= n
    k = K[-1] + 1
    K << k
    ST << 6**k + 5**k - 2**k - 1
    sf = (ST[-1] - 5 * ST[-2] - 4) / 4
    SF << sf if sf % 10 == 0
  end
  SF[n-1]
end
