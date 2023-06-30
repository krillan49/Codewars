#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task:
# We define the "self reversed power sequence" as one shown below:
#
# https://i.imgur.com/5PwwTaz.jpg
#
#
# Implement a function that takes 2 arguments (ord max and num dig), and finds the smallest term of the sequence whose index is less than or equal to ord max, and has exactly num dig number of digits.
#
# If there is a number with correct amount of digits, the result should be an array in the form:
#
# [true, smallest found term]
# [false, -1]
# Input range:
# ord_max <= 1000
# Examples:
# min_length_num(5, 10) == [true, 10]   # 10th term has 5 digits
# min_length_num(7, 11) == [false, -1]  # no terms before the 13th one have 7 digits
# min_length_num(7, 14) == [true, 13]   # 13th term is the first one which has 7 digits
# Which you can see in the table below:
#
# n-th Term    Term Value
# 1              0
# 2              1
# 3              3
# 4              8
# 5              22
# 6              65
# 7              209
# 8              732
# 9              2780
# 10             11377
# 11             49863
# 12             232768
# 13             1151914
# 14             6018785

#===============================================================================================================
#                                               Solution
#===============================================================================================================

SRPS = [0, 1]

def min_length_num(ndig, ind)
  SRPS << SRPS.size.downto(1).map.with_index(1){|n, i| n**i}.sum until SRPS.size >= ind + 1
  res = SRPS[0...ind].select{|e| e.to_s.size == ndig}
  res.empty? ? [false, -1] : [true, SRPS.index(res.min) + 1]
end
