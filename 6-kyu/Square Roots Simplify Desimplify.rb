#===============================================================================================================
#                                               Description
#===============================================================================================================

# What is simplifying a square root?
# If you have a number, like 80, for example, you would start by finding the greatest perfect square divisible by 80. In this case, that's 16. Find the square root of 16, and multiply it by 80 / 16. Answer = 4 √5.
#
# The above example:
# √80 = √(5 × 16) = √5 × √16 = √5 × 4 = 4√5
#
# Task:
# Your job is to write two functions, simplify, and desimplify, that simplify and desimplify square roots, respectively. (Desimplify isn't a word, but I couldn't come up with a better way to put it.) simplify will take an integer and return a string like "x sqrt y", and desimplify will take a string like "x sqrt y" and return an integer. For simplify, if a square root cannot be simplified, return "sqrt y".
#
# Do not modify the input.
#
# Some examples:
# simplify(1)  #=> "1"
# simplify(2)  #=> "sqrt 2"
# simplify(3)  #=> "sqrt 3"
# simplify(8)  #=> "2 sqrt 2"
# simplify(15) #=> "sqrt 15"
# simplify(16) #=> "4"
# simplify(18) #=> "3 sqrt 2"
# simplify(20) #=> "2 sqrt 5"
# simplify(24) #=> "2 sqrt 6"
# simplify(32) #=> "4 sqrt 2"
#
# desimplify("1")        #=> 1
# desimplify("sqrt 2")   #=> 2
# desimplify("sqrt 3")   #=> 3
# desimplify("2 sqrt 2") #=> 8
# desimplify("sqrt 15")  #=> 15
# desimplify("4")        #=> 16
# desimplify("3 sqrt 2") #=> 18
# desimplify("2 sqrt 5") #=> 20
# desimplify("2 sqrt 6") #=> 24
# desimplify("4 sqrt 2") #=> 32

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def simplify(n)
  return '1' if n == 1
  k = (n**0.5).floor
  return "#{k}" if k == n**0.5
  r = (1..k).select{|e| n % e**2 == 0}.max
  return "sqrt #{n}" if n < 4 or r == 1
  [r, n/r**2].join(' sqrt ')
end

def desimplify(s)
  a = s.split('sqrt ').map{|n| n == '' ? 1 : n.to_i}
  a[1] ? a[0]**2 * a[1] : a[0]**2
end
