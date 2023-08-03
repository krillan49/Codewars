#===============================================================================================================
#                                               Description
#===============================================================================================================

# Something is wrong with our Warrior class. All variables should initialize properly and the attack method is not working as expected.
#
# If properly set, it should correctly calculate the damage after an attack (if the attacker position is == to the block position of the defender: no damage; otherwise, the defender gets 10 damage if hit "high" or 5 damage if hit "low". If no block is set, the defender takes 5 extra damage.
#
# For some reason, the health value is not being properly set. The following shows an example of this code being used:
#
# ninja = Warrior('Hanzo Hattori')
# samurai = Warrior('Ryoma Sakamoto')
#
# samurai.block = 'l'
# ninja.attack(samurai, 'h')
# # samurai.health should be 90 now
# The warrios must be able to fight to the bitter end, and good luck to the most skilled!
#
# Notice that health can't be below 0: once hit to 0 health, a warrior attribute deceased becomes true; if hit again, the zombie attribute becomes true too!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

Position = {'high'=>'h', 'low'=>'l'}

class Warrior
  attr_accessor :block, :health, :name, :deceased, :zombie

  def initialize(name)
    @name = name
    @health = 100
    @block = ""
    @deceased, @zombie = false, false
  end

  def attack(enemy, position)
    damage = position == Position['high'] ? 10 : 5
    damage = 0 if enemy.block == position
    damage += 5 if enemy.block == ""
    enemy.set_health(damage)
  end

  def set_health(damage)
    @health = [0, @health - damage].max
    @deceased ? @zombie = true : (@deceased, @zombie = true, false) if @health == 0
  end
end
