#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a class called Warrior which calculates and keeps track of their level and skills, and ranks them as the warrior they've proven to be.
#
# Business Rules:
#
# A warrior starts at level 1 and can progress all the way to 100.
# A warrior starts at rank "Pushover" and can progress all the way to "Greatest".
# The only acceptable range of rank values is "Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage", "Elite", "Conqueror", "Champion", "Master", "Greatest".
# Warriors will compete in battles. Battles will always accept an enemy level to match against your own.
# With each battle successfully finished, your warrior's experience is updated based on the enemy's level.
# The experience earned from the battle is relative to what the warrior's current level is compared to the level of the enemy.
# A warrior's experience starts from 100. Each time the warrior's experience increases by another 100, the warrior's level rises to the next level.
# A warrior's experience is cumulative, and does not reset with each rise of level. The only exception is when the warrior reaches level 100, with which the experience stops at 10000
# At every 10 levels, your warrior will reach a new rank tier. (ex. levels 1-9 falls within "Pushover" tier, levels 80-89 fall within "Champion" tier, etc.)
# A warrior cannot progress beyond level 100 and rank "Greatest".
# Battle Progress Rules & Calculations:
#
# If an enemy level does not fall in the range of 1 to 100, the battle cannot happen and should return "Invalid level".
# Completing a battle against an enemy with the same level as your warrior will be worth 10 experience points.
# Completing a battle against an enemy who is one level lower than your warrior will be worth 5 experience points.
# Completing a battle against an enemy who is two levels lower or more than your warrior will give 0 experience points.
# Completing a battle against an enemy who is one level higher or more than your warrior will accelarate your experience gaining. The greater the difference between levels, the more experinece your warrior will gain. The formula is 20 * diff * diff where diff equals the difference in levels between the enemy and your warrior.
# However, if your warrior is at least one rank lower than your enemy, and at least 5 levels lower, your warrior cannot fight against an enemy that strong and must instead return "You've been defeated".
# Every successful battle will also return one of three responses: "Easy fight", "A good fight", "An intense fight". Return "Easy fight" if your warrior is 2 or more levels higher than your enemy's level. Return "A good fight" if your warrior is either 1 level higher or equal to your enemy's level. Return "An intense fight" if your warrior's level is lower than the enemy's level.
# Logic Examples:
#
# If a warrior level 1 fights an enemy level 1, they will receive 10 experience points.
# If a warrior level 1 fights an enemy level 3, they will receive 80 experience points.
# If a warrior level 5 fights an enemy level 4, they will receive 5 experience points.
# If a warrior level 3 fights an enemy level 9, they will receive 720 experience points, resulting in the warrior rising up by at least 7 levels.
# If a warrior level 8 fights an enemy level 13, they will receive 0 experience points and return "You've been defeated". (Remember, difference in rank & enemy level being 5 levels higher or more must be established for this.)
# If a warrior level 6 fights an enemy level 2, they will receive 0 experience points.
# Training Rules & Calculations:
#
# In addition to earning experience point from battles, warriors can also gain experience points from training.
# Training will accept an array of three elements (except in java where you'll get 3 separated arguments): the description, the experience points your warrior earns, and the minimum level requirement.
# If the warrior's level meets the minimum level requirement, the warrior will receive the experience points from it and store the description of the training. It should end up returning that description as well.
# If the warrior's level does not meet the minimum level requirement, the warrior doesn not receive the experience points and description and instead returns "Not strong enough", without any archiving of the result.
# Code Examples:
#
# bruce_lee = Warrior.new
# bruce_lee.level         # => 1
# bruce_lee.experience    # => 100
# bruce_lee.rank          # => "Pushover"
# bruce_lee.achievements  # => []
# bruce_lee.training(["Defeated Chuck Norris", 9000, 1]) # => "Defeated Chuck Norris"
# bruce_lee.experience    # => 9100
# bruce_lee.level         # => 91
# bruce_lee.rank          # => "Master"
# bruce_lee.battle(90)    # => "A good fight"
# bruce_lee.experience    # => 9105
# bruce_lee.achievements  # => ["Defeated Chuck Norris"]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Warrior
  attr_reader :level, :experience, :rank, :achievements

  def initialize
    @experience = 100
    @level = 1
    @rank = "Pushover"
    @rank_levels = [
      [1..9, "Pushover"], [10..19, "Novice"], [20..29, "Fighter"], [30..39, "Warrior"],
      [40..49, "Veteran"], [50..59, "Sage"], [60..69, "Elite"], [70..79, "Conqueror"],
      [80..89, "Champion"], [90..99, "Master"], [100..100, "Greatest"]
    ]
    @achievements = []
  end

  def training(arr)
    if @level >= arr[2]
      @achievements << arr[0]
      @experience += arr[1]
      level_rank_new
      arr[0]
    else
      'Not strong enough'
    end
  end

  def battle(lvl)
    if lvl > 100 or lvl < 1
      'Invalid level'
    elsif lvl/10 - @level/10 >= 1 and lvl - @level >= 5
      "You've been defeated"
    elsif @level >= lvl + 2
      'Easy fight'
    elsif @level == lvl + 1
      @experience += 5
      level_rank_new
      'A good fight'
    elsif @level == lvl
      @experience += 10
      level_rank_new
      'A good fight'
    elsif @level < lvl
      @experience += 20 * (lvl - @level)**2
      level_rank_new
      'An intense fight'
    end
  end

  private

  def level_rank_new
    @experience = 10000 if @experience > 10000
    @level = @experience / 100
    @rank_levels.each {|arr| @rank = arr[1] if arr[0].include?(@level)}
  end
end
