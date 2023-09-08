#===============================================================================================================
#                                               Description
#===============================================================================================================

# ###RELATED: https://www.codewars.com/kata/implement-array-number-transpose
#
# Arrays can be transposed with Array#transpose. (Transposition is the process of swapping rows and columns in an array; see the Ruby Array class docs for more info: https://ruby-doc.org/core-2.3.0/Array.html).
#
# arr = [[1,2,7],[3,5,6]]
# arr.transpose # returns [[1,3],[2,5],[7,6]]
# But strings that look like matrices (example below) can't.
#
# formatted_matrix = <<-HEREDOC
# 1 2 3 4
# 5 6 7 8
# 9 0 1 0
# HEREDOC
# ####Task: Your job is to implement String#transpose, which takes a string that looks like the one above, and transposes it. It should return "Invalid input" when the number of values in each row are not the same. Values in each row will be separated by a space (as such, values in a row need not be of equal length), and rows will be separated by a line break "\n". The input may contain characters like ~, !, @, etc. but it won't contain characters you can't type on your keyboard (on a regular English keyboard). Your method should not modify the input string.
#
# ####Examples (see example test cases for more):
#
# formatted_matrix1 = "1 2 3 4\n5 6 7 8\n9 0 1 0\n"
# puts formatted_matrix # prints
# 1 2 3 4
# 5 6 7 8
# 9 0 1 0
#
# formatted_matrix.transpose #=> "1 5 9\n2 6 0\n3 7 1\n4 8 0"
# puts formatted_matrix.transpose # prints
# 1 5 9
# 2 6 0
# 3 7 1
# 4 8 0
#
#
# formatted_matrix2 = "str st s 1\nstring q w e\nr t y 0\n"
# puts formatted_matrix2 # prints
# str st s 1
# string q w e
# r t y 0
#
# formatted_matrix2.transpose #=> "str string r\nst q t\ns w y\n1 e 0"
# puts formatted_matrix2.transpose # prints
# str string r
# st q t
# s w y
# 1 e 0
#
#
# formatted_matrix3 = "str s 1\nstring q w e\ny 0\n"
# puts formatted_matrix3 # prints
# str s 1
# string q w e
# y 0
#
# formatted_matrix3.transpose #=> returns 'Invalid input' as the number of values in each row isn't equal
# Since it is difficult to debug code that prints lots of "\n"s, I have added a function (in the full test suite) that puts the input, expected, and actual values to the console when a test fails. It looks like this when run:
#
# Input:
# 1 2 3 4
# 5 6 7 8
# 9 0 1 0
# Expected:
# 1 5 9
# 2 6 0
# 3 7 1
# 4 8 0
# But got:
# 1 2 3 4
# 5 6 7 8
# 9 0 1 0
# So whenever something fails, look out for that!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class String
  def transpose
    arr = self.split("\n").map(&:split)
    return 'Invalid input' if arr.map.any?{|e| e.size != arr[0].size}
    arr.transpose.map{|a| a.join(' ')}.join("\n")
  end
end
