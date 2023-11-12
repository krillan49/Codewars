#===============================================================================================================
#                                               Description
#===============================================================================================================

# Tolkein's publisher wishes to implement an online store for the "Lord of the Rings" and "The Hobbit" books. Each book costs $10. However, if 2 titles are purchased, a 5% discount will be received, i.e. purchasing "Fellowship of the Ring" and "Two Towers" will cost $19. If 3 different titles are purchased, a 10% discount will be received. The purchase of all 4 different titles will receive a 20% discount. An additional single title will be full-price.
#
# The encoding of an order will be in the form of strings in an array. For example: [“F”, “T”, “R”, “H”, “H”] is the encoding of 2 copies of "The Hobbit" and a single copy of each of the titles in the "Lord of the Rings" trilogy.
#
# The expected output is a number. E.g. 42 is the expected output for the example above. The output should be the cheapest total cost. For example - if the book order is ["F", "T", "H", "F", "T", "R"], valid total costs include (3*10 discounted by 10%) + (3*10 discounted by 10%) and (4*10 discounted by 20%) + (2*10 discounted by 5%). The cheapest total cost is 51.
#
# This is a slightly simplified version of http://codingdojo.org/kata/Potter/

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def calculate_cart_total(cart)
  sum = 0
  list = cart.tally
  4.downto(1) do |n|
    k = [1, 0.95, 0.9, 0.8][n-1]
    if list.keys.size == n
      min = list.values.min
      list.each{|key, v| list[key] -= min}
      sum += min * n * 10 * k
      list.reject!{|key, v| v == 0}
    end
  end
  sum
end
