#===============================================================================================================
#                                               Description
#===============================================================================================================

# Zonk is addictive dice game. In each round player rolls 6 dice. Then (s)he composes combinations from them. Each combination gives certain points.
#
# Then player can take one or more dice combinations to his hand and re-roll remaining dice or save his score. Dice in player's hand won't be taken into account in subsequent rolls.
#
# If no combinations can be composed - situation is called "zonk". Player thrown zonk loses all points in this round and next player moves. So it's player decision when to reroll and when to stop and save his score.
#
# Your task is simple - just evaluate current roll and return maximum number of points can be scored from it. If no combinations can be made - function must return string "Zonk" (without quotes) in dynamically typed languages or Zonk in C.
#
# There are different variations of Zonk. In this kata, we will use most common table of combinations:
#
# Combination	Example roll	Points
# Straight (1,2,3,4,5 and 6)	6 3 1 2 5 4	1000 points
# Three pairs of any dice	2 2 4 4 1 1	750 points
# Three of 1	1 4 1 1	1000 points
# Three of 2	2 3 4 2 2	200 points
# Three of 3	3 4 3 6 3 2	300 points
# Three of 4	4 4 4	400 points
# Three of 5	2 5 5 5 4	500 points
# Three of 6	6 6 2 6	600 points
# Four of a kind	1 1 1 1 4 6	2 × Three-of-a-kind score (in example, 2000 pts)
# Five of a kind	5 5 5 4 5 5	3 × Three-of-a-kind score (in example, 1500 pts)
# Six of a kind	4 4 4 4 4 4	4 × Three-of-a-kind score (in example, 1600 pts)
# Every 1	4 3 1 2 2	100 points
# Every 5	5 2 6	50 points
# Each die cannot be used in multiple combinations the same time, so three pairs of 2, 3 and 5 will worth you only 750 points (for three pairs), not 850 (for three pairs and two fives). But you can select multiple combinations, 2 2 2 1 6 will worth you 300 points (200 for three-of-kind '2' plus 100 for single '1' die)
#
# Examples:
# [1,2,3] =>  returns 100 = points from one 1
# [3,4,1,1,5] =>  returns 250 = points from two 1 and one 5
# [2,3,2,3,3,2] =>  returns 500 = three of 2 + three of 3
# [1,1,1,1,1,5] =>  returns 3050 = five 1 + one 5
# [2,3,4,3,6,6] =>  returns "Zonk" = no combinations here
# [2,2,6,6,2,2] =>  returns 400 = four 2, this cannot be scored as three pairs
# [1,3,4,3,4,1] =>  returns 750 = three pairs
# [3,3,3,3] =>  returns 600 = four of 3
# [1,2,3,4,5] =>  returns 150 = it's not straight
# Of course, in real Zonk game it's sometimes not worth to collect all combination from roll. Taking less dice and rerolling more remaining may be better, but task is just to calculate maximum possible score from current single roll.
#
# P.S. Inspired by this kata: https://www.codewars.com/kata/5270d0d18625160ada0000e4

#===============================================================================================================
#                                               Solution
#===============================================================================================================

CB = {
  '123456'=>1000,
  "112233"=>750, "112244"=>750, "112255"=>750, "112266"=>750, "113344"=>750, "113355"=>750, "113366"=>750,
  "114455"=>750, "114466"=>750, "115566"=>750, "223344"=>750, "223355"=>750, "223366"=>750, "224455"=>750,
  "224466"=>750, "225566"=>750, "334455"=>750, "334466"=>750, "335566"=>750, "445566"=>750,
  '111'=>1000, '222'=>200, '333'=>300, '444'=>400, '555'=>500, '666'=>600,
  '1111'=>2000, '2222'=>400, '3333'=>600, '4444'=>800, '5555'=>1000, '6666'=>1200,
  '11111'=>3000, '22222'=>600, '33333'=>900, '44444'=>1200, '55555'=>1500, '66666'=>1800,
  '111111'=>4000, '222222'=>800, '333333'=>1200, '444444'=>1600, '555555'=>2000, '666666'=>2400,
  '11'=>200, '55'=>100, '1'=>100, '5'=>50, ''=>0
}
CBS = (CB.keys + ['']).combination(3).select{|a, b, c| (a + b + c).size <= 6}
.map{|a, b, c| [ [a, b, c].join.chars.map(&:to_i).sort, CB[a] + CB[b] + CB[c] ]}.sort_by{|a, b| -b}

def tally_2_5(arr)
  arr.group_by{|e| e}.map{|k, v| [k, v.size]}.to_h
end

def common(a,b)
  ha, hb = tally_2_5(a), tally_2_5(b)
  (ha.keys + hb.keys).uniq.map do |k|
    values = [ha[k], hb[k]]
    values.compact.size < 2 ? nil : [k] * values.min
  end.compact.flatten
end

def get_score(dice)
  CBS.each{|arr, cash| return cash if common(dice.sort, arr) == arr}
  'Zonk'
end
