#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given an array of arguments, representing system call arguments keys and values, join it into a single, space-delimited string. You don't need to care about the application name -- your task is only about parameters.
#
# Each element of the given array can be:
#
# a single string,
# a single string array,
# an array of two strings
# In the last case (array of two strings) the first string should have a "--" prefix if it is more than one character long; or a "-" prefix otherwise; e.g.:
#
# ["foo", "bar"] becomes "--foo bar"
# ["f", "bar"] becomes "-f bar"
# You may assume that all strings are non-empty and have no spaces.
#
# Examples
# ["foo", "bar"]                    #  "foo bar"
# [["foo", "bar"]]                  #  "--foo bar"
# [["f", "bar"]]                    #  "-f bar"
# [["foo", "bar"], "baz"]           #  "--foo bar baz"
# [["foo"], ["bar", "baz"], "qux"]  #  "foo --bar baz qux"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def args_to_string args
  args.map{|a| a.class != Array || a.size == 1 ? a : a[0].size == 1 ? "-#{a[0]} #{a[1]}" : "--#{a[0]} #{a[1]}"}.join(' ')
end
