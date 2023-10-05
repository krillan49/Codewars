#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are in a maze. There are a lot of doors, you have to find the passcode to open them. There are some numbers next to each door, and you need to find the passcode from these numbers.
#
# You will coding in function findKey. parameter: int array nums, contains some numbers like this:
#
# [153456,123406,124456,323456,123458,123756]
# How to find the passcode? Let's change the arrangement method:
#
# [
# 153456,
# 123406,
# 124456,
# 323456,
# 123458,
# 123756
# ]
# We can see that each column has one number different from the others, they are the passcode.
#
# Please find out the passcode and return it(a string value).
#
# Examples
# findKey([153456,123406,124456,323456,123458,123756])
# should return "354708"
#
# findKey([7347289,3647289,3357289,3344289,3347389,3347229,3347281])
# should return "7654321"
#
# findKey([232326,232363,232523,235323,242323,432323])
# should return "445566"
#
# findKey([13579,13579,13579,13579,24680])
# should return "24680"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_key(nums)
  nums.map{|n| n.digits.reverse}.transpose.map{|a| a.find{|e| a.count(e) == 1}}.join
end
