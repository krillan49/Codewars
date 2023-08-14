#===============================================================================================================
#                                               Description
#===============================================================================================================

# Complete the function/method so that it takes a PascalCase string and returns the string in snake_case notation. Lowercase characters can be numbers. If the method gets a number as input, it should return a string.
#
# Examples
# "TestController"  -->  "test_controller"
# "MoviesAndBooks"  -->  "movies_and_books"
# "App7Test"        -->  "app7_test"
# 1                 -->  "1"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def to_underscore(string)
  return string.to_s if string.class != String
  string.chars.slice_when{|a, b| /[A-Z]/ === b}.map{|a| a.join.downcase}.join('_')
end
