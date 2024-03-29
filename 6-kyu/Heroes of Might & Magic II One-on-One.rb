#===============================================================================================================
#                                               Description
#===============================================================================================================

# Inspired by another Kata - Heroes of Might & Magic II: Chain Lightning by Firefly2002, I thought I might have a go at another Kata related to this game.
#
# In this Kata, two groups of monsters will attack each other, and your job is to find out who wins. Each group will have a stat for each of the following: number of units, hitpoints per unit, damage per unit, and monster type.
#
# If you are not familiar with the game, just think of each group as standing in a line so that when they are attacked the unit at the front of the line takes the hit before the others, and if he dies the remaining damage will hit the next unit and so on. Therefore multiple units (or even the whole group) can die in one attack.
#
# Each group takes turns attacking, and does so until only one remains. In this kata, the first entry in the input array is the first to attack.
#
# The inputs for this game will be two dictionaries, each with the stats of each monster. Using these stats, calculate which group wins, and how many units in that group stay alive (unless they are undead :P), and return it as a string - formatted as below:
#
# Note: These are Ruby Objects, not hashes.
# Input:
# mon1 = Monster.new(type = "Roc",     hitpoints = 40, number = 6, damage = 8)
# mon2 = Monster.new(type = "Unicorn", hitpoints = 40, number = 4, damage = 13)
#
# Output:
# "[NUMBER] [TYPE](s) won"   # in this case "5 Roc(s) won"
# The damage of each attack is calculated simply as (number of units) * (damage per unit).
#
# You must also take into account that the first unit in the group may injured BUT he still attacks with full strength.
#
# Fighting mechanics explanation:
#
# mon1 = {"type": "Roc",     "hitpoints": 40, "number": 6, "damage":8 }
# mon2 = {"type": "Unicorn", "hitpoints": 40, "number": 4, "damage":13}
#
# 1) The Rocs attack the Unicorns for 48 damage (6 * 8),
#    killing one and damaging the next - leaving it with 32/40 hitpoints.
# 2) The remaining 3 Unicorns attack the Rocs for 39 damage (3 * 13),
#    killing 0 but leaving the first one with only 1/40 hitpoints.
# 3) Repeat until one of the groups is left with 0 units in total.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def who_would_win(mon1, mon2)
  m1 = {name: mon1.type, hp1: mon1.hitpoints, hp: mon1.hitpoints * mon1.number, n: mon1.number, dam: mon1.damage }
  m2 = {name: mon2.type, hp1: mon2.hitpoints, hp: mon2.hitpoints * mon2.number, n: mon2.number, dam: mon2.damage }
  loop do
    m2[:hp] -= m1[:n] * m1[:dam]
    m2[:n] = (m2[:hp].to_f / m2[:hp1]).ceil
    return "#{m1[:n]} #{m1[:name]}(s) won" if m2[:hp] <= 0

    m1[:hp] -= m2[:n] * m2[:dam]
    m1[:n] = (m1[:hp].to_f / m1[:hp1]).ceil
    return "#{m2[:n]} #{m2[:name]}(s) won" if m1[:hp] <= 0
  end
end
