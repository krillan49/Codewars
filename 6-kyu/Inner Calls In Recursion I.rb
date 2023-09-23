#===============================================================================================================
#                                               Description
#===============================================================================================================

# For a certain simulation, a group of students have to produce numbers close to 2 in a certain order. Their instructor guide them explaining an algorithm useful for that task.
#
# An array of integers, arr, is received.
#
# arr = [n1, n2, ....,nk]
#
# The array should be transformed, doing the following steps:
#
# each value of the array, ni, will be substituted by the value (ni + μ) / μ
# μ = (Σ ni) / k  (mean of the array)
#
# After doing this process recursively, it will be seen that the final array will trend to this final one: [2.0, 2.0, .....2.0]
#
# Let's start with this one: [12, 7, 23]
#
# array                                               μ                             transformed array                        number of calls
# [12, 7, 23]                                        14.0             [1.8571428571428572, 1.5, 2.642857142857143]                1
# [1.8571428571428572, 1.5, 2.642857142857143]        2.0             [1.9285714285714286, 1.75, 2.321428571428571]               2
# [1.9285714285714286, 1.75, 2.321428571428571]       2.0             [1.9642857142857144, 1.875, 2.1607142857142856]             3
# .............................................       ....             ............................................               ...
# .............................................       ....             ............................................               ...
# [2.0, 2.0, 2.0]                                     2.0             [2.0, 2.0, 2.0]                                            54
# After certain number of recursive steps, the difference between 2 and the obtained values is so small that cannot be detected by the programming language system.
#
# In order to estimate the amount of generated values, they need to determine the number of recursive calls for this process.
#
# Do you want to help them?
#
# They need the function simul_close_to2() that receives a certain array, and a minimum absolute error, abs_error. The function will output the inner calls.
#
# The recursion should stop when |arr[i] - arr[i + 1]| ≤ abs_error for all i of the array. For that purpose we need a helper function are_contigElemen_closeEnough() that receives an array and the abs_error and outputs True when this condition is fulfilled and False when not.
#
# Let's see the above case for different absolute errors:
#
# simul_close_to2([12, 7, 23], pow(10, -5)) == 18 # final array [1.9999989100864957, 1.9999961853027344, 2.00000490461077]
#
# simul_close_to2([12, 7, 23], pow(10, -8)) == 28 # final array [1.9999999989356314, 1.9999999962747097, 2.000000004789659]
#
# simul_close_to2([12, 7, 23], pow(10, -12)) == 42 # final array [1.9999999999999352, 1.9999999999997726, 2.000000000000292]
# The tests for the function will have the following features:
#
# N < 250 (N, number of tests)
# 3 ≤ L ≤ 5000 (L, length of the array)
# 1 ≤ ni ≤ 10000000 (arr = [n1, n2,..., ni, ..., nk])
# 10^(-17) ≤ abs_error ≤ 0.001

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def simul_close_to2(arr, abs_error, count = 0)
  loop do
    return count if arr.each_cons(2).all?{|a, b| (a-b).abs <= abs_error}
    u = arr.sum / arr.size.to_f
    arr.map!{|n| (n + u) / u}
    count += 1
  end
end
