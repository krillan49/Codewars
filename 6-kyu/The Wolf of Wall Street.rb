#===============================================================================================================
#                                               Description
#===============================================================================================================

# Suppose we could access yesterday's stock prices as a list, where:
#
# The indices are the time in minutes past trade opening time, which was 9:30am local time. The values are the price in dollars of Apple stock at that time. So if the stock cost $500 at 10:30am, stock_prices_yesterday[60] = 500.
#
# Write a method that takes a list of yesterday's stock prices and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.
#
# Watch out! What if the stock value goes down all day? In that case, the best profit will be negative!
#
# You need to return the optimum buy and sell price, as well as the optimum profit made from the sale, in the format of an array with three indices.
#
# e.g. [optimum_buy_price, optimum_sell_price, profit]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_max_profit(prices)
  prices.map.with_index{|p, i| [p, prices[i..-1].max, prices[i..-1].max - p]}.max_by{|a| a[2]}
end
