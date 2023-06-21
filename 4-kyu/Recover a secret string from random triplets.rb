#===============================================================================================================
#                                               Description
#===============================================================================================================

# There is a secret string which is unknown to you. Given a collection of random triplets from the string, recover the original string.
#
# A triplet here is defined as a sequence of three letters such that each letter occurs somewhere before the next in the given string. "whi" is a triplet for the string "whatisup".
#
# As a simplification, you may assume that no letter occurs more than once in the secret string.
#
# You can assume nothing about the triplets given to you other than that they are valid triplets and that they contain sufficient information to deduce the original string. In particular, this means that the secret string will never contain letters that do not occur in one of the triplets given to you.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def recover_secret triplets
  res = []
  tri = triplets.transpose
  until tri.flatten.compact == []
    tri[0].each.with_index do |c, i|
      if c && !tri[1].include?(c) && !tri[2].include?(c)
        res << c
        tri[0][i] = tri[1][i]
        tri[1][i] = tri[2][i]
        tri[2][i] = nil
      end
    end
  end
  res.uniq.join
end
