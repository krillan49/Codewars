#===============================================================================================================
#                                               Description
#===============================================================================================================

# Before you start, try the previous kata in the series:
# Arrays and Procs #1
#
# Functions like the one below can be invoked on values as shown:
#
# def func(a)
#   a + a
# end
#
# func(1) #=> 2
# func(“str”) #=> “strstr”
# func(21) #=> 42
# Procs like the one below have a slightly different syntax. For more on that syntax, see the Ruby Proc docs.
#
# func = proc { | a | a + a }
# func.call(1) #=> 2
# Task:
# Your job here is to implement a function (named array_procs) that will take an array, arr, and a variable number of procs, procs, and apply the procs, in order, to their corresponding index in the array. When you run out of procs to apply and there are still array values without procs applied, go back to the first proc and continue from the start. If there are more procs than array elements, leave out the extra ones (from the end). Up to fifteen procs may be inputted. Note that Proc#call is disabled, so neither of the following will work:
#
# x = proc { | i | i + 2 }
# x.(2)
# x.call(2)
# How the function will be called:
# array_procs(an_array, any_number_of_procs1, any_number_of_procs2,...)
# Some examples:
# arr = [1, 2, 4, 6, 7, 8]
# proc1 = proc { | i | i * 2 }
# proc2 = proc { | i | i + 1 }
# array_procs(arr, proc1, proc2) #=>
#   [(1 * 2), (2 + 1), (4 * 2), (6 + 1), (7 * 2), (8 + 1)]
#   [      2,       3,       8,       7,      14,       9]
# array_procs(arr, proc2, proc1) #=>
#   [(1 + 1), (2 * 2), (4 + 1), (6 * 2), (7 + 1), (8 * 2)]
#   [      2,       4,       5,      12,       8,      16]
# array_procs(arr, proc2) #=>
#   [(1 + 1), (2 + 1), (4 + 1), (6 + 1), (7 + 1), (8 + 1)]
#   [      2,       3,       5,       7,       8,       9]
# array_procs(arr) #=>
#   [1, 2, 4, 6, 7, 8] since there are no procs to apply on the elements
# Also, whenever one of the tests fails, the procs applied will be printed to the console. This is because it is difficult to print the source code for procs, and so the string values of the failed inputs would help.
#
# All input procs will take only one argument, but some procs may take an argument and not use it (for example, proc { | i | 0 + 2 + 22 } is valid, and should change every value applied to 22). There will also be no need to ensure that the first argument is an array or that the rest of the arguments are proc functions. And again, Proc#call is disabled.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def array_procs(arr, *pr)
  res = [*arr]
  (0...res.size).each do |i|
    res[i] = [res[i]].map(&pr[0]).max
    pr.rotate!
  end
  res
end
