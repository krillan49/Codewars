#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have the following recursive function:
#
# https://imgur.com/1jHY37y
#
# The 15-th term; f(14) is the first term in having more that 100 digits.
#
# In fact,
#
# f(14) = 2596253046576879973769082409566059879570061514363339324718953988724415850732046186170181072783243503881471037546575506836249417271830960970629933033088
#
# It has 151 digits.
# Make the function something_acci(), that receives num_dig (number of digits of the value) as unique argument.
#
# something_acci() will output a tuple/array with the ordinal number in the sequence for the least value in having equal or more than the given number of digits.
#
# Let's see some cases:
#
# something_acci(20) == [12, 25]
# # f(11) = 1422313222839141753028416
#
# something_acci(100) == [15, 151]
# The number of digits given will be always more than 5. num_dig > 5.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

FRYN = [1, 1, 2, 2, 3, 3]

def something_acci(nd)
  until nd <= FRYN[-1].to_s.size
    FRYN << FRYN[-1] * FRYN[-2] * FRYN[-3] - FRYN[-4] * FRYN[-5] * FRYN[-6]
  end
  i = FRYN.index(FRYN.find{|n| n.to_s.size >= nd})
  [i + 1, FRYN[i].to_s.size]
end
