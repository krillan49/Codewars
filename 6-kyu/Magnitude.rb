#===============================================================================================================
#                                               Description
#===============================================================================================================

# We will represent complex numbers in either cartesian or polar form as an array/list, using the first element as a type tag; the normal tags are "cart" (for cartesian) and "polar". The forms of the tags depend on the language.
#
# ['cart', 3, 4]represents the complex number 3+4i
# ['polar', 2, 3]represents the complex number with modulus (or magnitude)2and angle3
# In the same way:
#
# ['cart', 1, 2, 3, 4, 5, 6]includes the three complex numbers 1+2i, 3+4i, 5+6i
# ['polar', 2, 1, 2, 2, 2, 3] represents the complex numbers (2, 1), (2, 2), (2, 3) in polar form where the magnitudes are 2, 2, 2 and the angles 1, 2, 3
# Note:
# The polar form of a complex number z = a+bi is z = (r, θ) = r(cosθ+isinθ), where r = |z| = the (non-negative) square-root of a^2+b^2 is the modulus.
# In the arrays/lists beginning by a tag all terms after the tag must be integers (no floats, no strings).
# Task
# Given a sequence of complex numbers z in one of the previous forms we first calculate the sum s of the squared modulus of all complex elements of z if z is in correct form.
#
# Our function sqr-modulus returns an array/list of three elements; the form of the list will depend on the language:
#
# the first element is a boolean:
# #t or True or true if z is in correct form as defined previously (correct type of numbers, correct tag)
#
# #f or False or false if z is not in correct form.
#
# the second element is the sum s of the squared modulus of all complex numbers in z if the returned boolean is true, -1 if it is false.
# the third element is the greatest number got by rearranging the digits of s. We will admit that the greatest number got from-1 is 1.
# Examples (in general form):
# See the exact form of the return for your language in "RUN SAMPLE TESTS"
#
# sqr_modulus(['cart', 3, 4]) -> (True , 25, 52)
# sqr_modulus(['cart', 3, 4, 3, 4]) -> (True , 50, 50)
# sqr_modulus(['polar', 2531, 3261]) -> (True , 6405961, 9665410)
# sqr_modulus(['polar', 2, 3, 2, 4]) -> (True , 8, 8)
# sqr_modulus(['polar', "2", 3]) -> (False , -1, 1)
# sqr_modulus(['polara', 2, 3]) -> (False , -1, 1)
# sqr_modulus(['cart', 3, 4.1]) -> (False , -1, 1)
# Notes:
# Racket: in Racket (integer? 2.0) returns #t
# Pascal: The given input is a string; the first substring is the tag; other substrings represent integers or floats or strings. The first element of return is -1 for 'false' or 1 for true.
# Shell: in this kata an object will be an integer if it contains only digits.
# Perl see "Template Solution".

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sqr_modulus(z)
  return [false, -1, 1] if z[1..-1].any?{|e| e.class != Integer} || !['cart', 'polar'].include?(z[0])
  nums = z[1..-1].each_slice(2).to_a
  smod = z[0] == 'cart' ? nums.sum{|x, y| x**2 + y**2} : nums.sum{|x, y| x**2}
  [true, smod, smod.digits.sort.reverse.join.to_i]
end
