#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have an array with string digits that occurrs more than once, for example, arr = ['1', '2', '2', '2', '3', '3']. How many different string numbers can be generated taking the 6 elements at a time?
#
# We present the list of them below in an unsorted way:
#
# ['223213', '312322', '223312', '222133', '312223', '223321', '223231', '132223', '132322', '223132', '322321', '322312', '231322', '222313', '221233', '213322', '122323', '321322', '221332', '133222', '123232', '323221', '222331', '132232', '321232', '212323', '232213', '232132', '331222', '232312', '332212', '213223', '123322', '322231', '321223', '231232', '233221', '231223', '213232', '312232', '233122', '322132', '223123', '322123', '232231', '323122', '323212', '122233', '212233', '123223', '332221', '122332', '221323', '332122', '232123', '212332', '232321', '322213', '233212', '313222']
# There are 60 different numbers and 122233 is the lowest one and 332221 the highest of all of them.
#
# Given an array, arr, with string digits (from '0' to '9'), you should give the exact amount of different numbers that may be generated with the lowest and highest value but both converted into integer values, using all the digits given in the array for each generated string number.
#
# The function will be called as proc_arr().
#
# proc_arr(['1', '2', '2', '3', '2', '3']) == [60, 122233, 332221]
# If the digit '0' is present in the given array will produce string numbers with leading zeroes, that will not be not taken in account when they are converted to integers.
#
# proc_arr(['1','2','3','0','5','1','1','3']) == [3360, 1112335, 53321110]
# You will never receive an array with only one digit repeated n times.
#
# Features of the random tests:
#
# Low performance tests:
# Number of tests: 100
# Arrays of length between 6 and 10
#
# Higher performance tests:
# Number of tests: 100
# Arrays of length between 30 and 100

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def proc_arr(arr)
  n = (1..arr.size).inject(:*) / arr.uniq.map{|e| (1..arr.count(e)).inject(:*)}.inject(:*)
  [n, arr.sort.join.to_i, arr.sort.reverse.join.to_i]
end
