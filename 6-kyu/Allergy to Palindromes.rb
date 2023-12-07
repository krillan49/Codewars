#===============================================================================================================
#                                               Description
#===============================================================================================================

# A friend of mine told me privately: "I don't like palindromes". "why not?" - I replied. "Because when I want to do some programming challenges, I encounter 2 or 3 ones first related with palindromes. I'm fed up" - he confess me with anger. I said to myself:"Thankfully, that doesn't happen in Codewars". Talking seriously, we have to count the palindrome integers. Doing that, perhaps, it will help us to make all the flood of palindrome programming challenges more understandable.
#
# For example all the integers of 1 digit (not including 0) are palindromes, 9 cases. We have nine of them with two digits, so the total amount of palidromes below 100 (102) is 18. At least, will we be able to calculate the amount of them for a certain number of digits? Let's say for 2000 digits? Prepare a code that given the number of digits n, may output the amount of palindromes of length equals to n and the total amount of palindromes below 10n.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def count_pal(n)
  [n.odd? ? 10**(n/2)*9 : 10**(n/2-1)*9, (1..n).sum{|k| k.odd? ? 10**(k/2)*9 : 10**(k/2-1)*9 }]
end
