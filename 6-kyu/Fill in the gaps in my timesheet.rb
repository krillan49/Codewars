#===============================================================================================================
#                                               Description
#===============================================================================================================

# At work I need to keep a timesheet, by noting which project I was working on every 15 minutes. I have an timer that beeps every 15 minutes to prompt me to note down what I was working on at that point, but sometimes when I'm away from my desk or working continuously on one project, I don't note anything down and these get recorded as null.
#
# Task:
# Help me populate my timesheet by replacing any null values in the array with the correct project name which is given by surrounding matching values.
#
# Examples:
# fill_gaps([1,nil,1]) -> [1,1,1]   # Replace nill values surrounded by matching values
# fill_gaps([1,nil,nil,nil,1]) -> [1,1,1,1,1]  # There may be multiple nils
# fill_gaps([1,nil,1,2,nil,2]) -> [1,1,1,2,2,2]  # There may be multiple replacements required
# fill_gaps([1,nil,2,nil,2,nil,1]) -> [1,nil,2,2,2,nil,1]  # No nesting.
# fill_gaps([1,nil,2]) -> [1,nil,2] # No replacement if ends don't match
# fill_gaps([nil,1,nil]) -> [nil,1,nil] # No replacement if ends don't match off the ends of the array
# fill_gaps(['codewars', nil, nil, 'codewars', 'real work', nil, nil, 'real work']) -> ["codewars", "codewars", "codewars", "codewars", "real work", "real work", "real work", "real work"] # Works with strings too
# Input:
# An array of values some of which will be null
#
# Output:
# An array with any consecutive null elements surrounded by equal values replaced by that value.
#
# Note:
# null is language specific, for Ruby it will be nil, for Python None
#
# Input will always be a valid array.
# The original array should not be modified.
# The output array might still contain null values. The values in the array can be of different data types, but as long as they are == they can be considered the same. In Haskell Maybe Int is used, hence numbers only and Nothing as an empty value
#
# Sometimes I forget to note when I stopped working on a project and started on a new one. In this case there will still be nulls in the resulting array. In this case I'll need to manually resolve the problem by checking my git logs or message timestamps for clues as to when I changed task. But that's not something you need to worry about in this kata.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def fill_gaps(arr)
	ar = arr.slice_when{|a, b| (!a && b) || (a && !b)}.to_a
  ar.map.with_index do |a, i|
    i != 0 && i != ar.size-1 && a.all?{|e| !e} && ar[i-1][-1] == ar[i+1][0] ? [ar[i+1][0]] * a.size : a
  end.flatten
end
