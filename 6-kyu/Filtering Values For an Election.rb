#===============================================================================================================
#                                               Description
#===============================================================================================================

# A specialist of statistics was hired to do an investigation about the people's voting intention for a certain candidate for the next elections.
#
# Unfortunately, some of the interviewers, hired for the researches, are not honest and they want to modify the results because, some of them like the candidate too much, or others hate him.
#
# The specialist suspects about the situation and will apply his own method named: Recursive 2.5 Standard Deviation Filter.
#
# He does not know who of them are cheating and obviously, he doesn´t know the minimum or maximum possible votes for this candidate.
#
# The method works with the following steps explained below:
#
# The method calculates the mean,  μ, and the standard deviation, σ for the received data that has n elements.
# https://imgur.com/qi97XWq
#
# A new data is obtained discarding all the values that are not in the range [μ - 2.5σ, μ + 2.5σ] (strictly lower or higher than these extremes)
#
# The values of  μ and σ are recalculated and an all the values will be filtered by the new range with the updated values of  μ and σ and so on.
#
# He receives the data from the interviewers. The data is the number of votes of samples less than 500 people per neighbourhood of a county.
#
# Let's see a suspect data, the exaggerated data was left at the end on purpose, to see it clearly:
#
# votes = [35, 34, 37, 32, 33, 36, 38, 32, 35, 35, 36, 34, 35, 100*, 85*, 70*]
# The values marked with an (*) are suspect, too high perhaps.
#
# Step                      Votes                                μ            σ           μ - 2.5*σ            μ + 2.5*σ     dicarded values
# 1    [35,34,37,32,33,36,38,32,35,35,36,34,35,100,85,70]    44.1875       20.3692        -6.7354               95.1104          100
# 2    [35,34,37,32,33,36,38,32,35,35,36,34,35,85,70]        40.4667       14.8677         3.2974               77.6359           85
# 3    [35,34,37,32,33,36,38,32,35,35,36,34,35,70]           37.2857        9.2229        14.2286               60.3429           70
# 4    [35,34,37,32,33,36,38,32,35,35,36,34,35]              34.7692        1.7166        30.4777               39.0608          ---
# The final values that will be output are ̅Xand s, ̅X = μ  and s = σ/√̅n because this will be consider a sample for another calculations.
#
# In this case ̅X = 34.7692 and s = 1.7166/√̅13 = 0.4761.
#
# We need a function filter_val(), that receives an array with the number of votes of different neighbourhoods of a county and may express the comparisson in the size of the data and the values of ̅X and s.
#
# For our case:
#
# filter_val([35,34,37,32,33,36,38,32,35,35,36,34,35,100,85,70]) == [[16, 13], 34.76923076923077, 0.4761016021276081] # you don't have to round the results
# # 16 was the length of the received array of votes, 13 is the length of the filtered data.
# The assumptions for this kata: the honest interviwers are much more than the cheaters and the last ones do not agree about the number of votes they will add or subtract, so the modified values are not equal or almost equal.
#
# Some "honest values" may be discarded with this process and all the "dishonest ones" will be eliminated in almost the total of cases but the method still gives a good result.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def filter_val(v)
  size0 = v.size
  loop do
    size = v.size
    u = v.sum / v.size.to_f
    q = Math.sqrt(v.map{|n| (n-u)**2}.sum / v.size.to_f)
    v = v.select{|n| (u-2.5*q..u+2.5*q).include?(n)}
    return [[size0, size], u, q/Math.sqrt(size)] if size == v.size
  end
end
