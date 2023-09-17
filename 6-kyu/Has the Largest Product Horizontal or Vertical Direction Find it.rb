#===============================================================================================================
#                                               Description
#===============================================================================================================

# You will be given a matrix of m rows and n columns like:
#
# https://imgur.com/0w2EWQb
#
# The matrix has some aij equals to 0 at different locations i, j and the others, all positive.
#
# Your task will be to find the maximum possible product in all the rows and in all the columns of contiguous elements (horizontally or vertically). The products should be result of at least two adjacent elements in vertical or horizontal direction.
#
# Let's see an example:
#
# matrix = [[2, 1, 4, 1], [0, 4, 8, 1], [1, 0, 10, 0]]
# The horizontal and vertical products of contiguous elements different than 0 will be:
#
# location        numbers         product      direction (H = horizontal, V = vertical)
# row 1            [2, 1]            2             H
# row 1            [1, 4]            4             H
# row 1            [4, 1]            4             H
# row 1          [2, 1, 4]           8             H
# row 1         [2, 1, 4, 1]         8             H
# row 2            [4, 8]           32             H
# row 2            [8, 1]            8             H
# row 2          [4, 8, 1]          32             H
# column 2         [1, 4]            4             V
# column 3         [4, 8]           32             V
# column 3         [8, 10]          80             V
# column 3       [4, 8, 10]        320             V <---- maximum product
# column 4         [1, 1]            1             V
# So, the function that calculates the maximum possible product will work in the following way:
#
# highest_prod([[2, 1, 4, 1], [0, 4, 8, 1], [1, 0, 10, 0]]) == 320
# If the abundance of zeroes in the matrix is very high, the result can be zero, although the matrix may have some numbers different than zero.
#
# highest_prod([[2, 0, 4, 0], [0, 0, 0, 0], [1, 0, 10, 0]]) == 0
# You will find more cases in the Example Test Cases box.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def prod(matrix)
  matrix.map{|arr| arr.slice_when{|a, b| a == 0 or b == 0}.reject{|a| a.size < 2} }.flatten(1)
  .map{|arr| (2..arr.size).map{|d| arr.each_cons(d).map{|a| a.inject(:*)} } }.flatten.max
end

def highest_prod(matrix)
  [prod(matrix), prod(matrix.transpose)].max || 0
end
