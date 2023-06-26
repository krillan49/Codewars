#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have the array of string digits, arr = ["3", "7", "7", "7", "3", "3, "3", "7", "8", "8", "8"].
#
# The string digit with the least frequency is "8" occurring three times. We will pop the first element of the array three times (exactly the same value of the minimum frequency) and we get "377"
#
# ["3", "7", "7", "7", "3", "3, "3", "7", "8", "8", "8"] ---> "3"
# ["7", "7", "7", "3", "3, "3", "7", "8", "8", "8"]      ---> "37"
# ["7", "7", "3", "3, "3", "7", "8", "8", "8"]           ---> "377"
# We change the order in the original array, arr, in a random way and we get another string number, in this case: "783"
#
# ['7', '8', '3', '3', '7', '3', '8', '3', '7', '8', '7'] ---> "7"
# ['8', '3', '3', '7', '3', '8', '3', '7', '8', '7']      ---> "78"
# ['3', '3', '7', '3', '8', '3', '7', '8', '7']           ---> "783"
# Repeating this process you will get all the possible string numbers of three digits we list them below in a random order:
#
# ['377', '783', '883', '887', '338', '337', '888', '333', '833', '837', '878', '877', '838', '873', '733', '737', '738', '777', '773', '778', '383', '387', '388', '787', '788', '378', '373'] (27 different string numbers) (I)
# From the set above the following string numbers have at least one string digit occurring more than once:
#
# ['377','883','887','338','337','888','333','833','878','877','838','733','737','777','773','778','383','388','787','788','373'] (total of 21 numbers) (II)
# From this above list, we get the integer 873, that is the highest number having digits occurring only once (pandigital). (III)
#
# Having in mind the random process shown above that generates string numbers, we need a function proc_arrII() that receives an array of string digits and outputs the total maximum possible amount of string numbers (I), the amount of digits that have at least one digit occurring more than once (II) and the highest pandigital number(III).
#
# The above case will be:
#
# proc_arrII(["3","7","7","7","3","3","3","7","8","8","8"]) == [27, 21, 873]
# More cases in the example box. The digit "0" may be included in the given array and is treated the same as any other digit.
#
# If it is not possible to generate a pandigital number the function will output only the total number of generated numbers. See the case below:
#
# proc_arrII(['3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '1', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '1', '3', '3', '3', '3', '3', '1', '3', '3']) = [8]
# Features of the random tests:
#
# Low Performance Tests:
# Length of array between 6 and 200
# Minimum occurrence of digits between 3 and 25
# Number of tests: 100

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def proc_arrII(arr)
  hh = arr.group_by{|e| e}.map{|k, v| [k, v.size]}.to_h # == tally if added Ruby ver 3 +
  min = hh.values.min
  unic_combs_perms = hh.map{|k, v| [k] * min}.size**min
  size = hh.keys.size
  return [unic_combs_perms] if min > size
  unic_els_perms = (1..size).inject(:*) / (size <= min ? 1 : (1..size-min).inject(:*))
  maxper = hh.keys.sort.reverse[0..min-1].join.to_i
  [unic_combs_perms, unic_combs_perms - unic_els_perms, maxper]
end
