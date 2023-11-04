#===============================================================================================================
#                                               Description
#===============================================================================================================

# Oh no... more lemmings!! And in Lemmings Planet a huge battle is being fought between the two great rival races: the green lemmings and the blue lemmings. Everybody was now assigned to battle and they will fight until one of the races completely dissapears: the Deadly War has begun!
#
# Every single lemming has a power measure that describes its ability to fight. When two single lemmings fight with each one, the lemming with more power survives and the other one dies. However, the power of the living lemming gets smaller after the fight, exactly in the value of the power of the lemming that died. For example, if we have a green lemming with power 50 and a blue lemming with power 40, the blue one dies and the green one survives, but having only power 10 after the battle (50-40=10). If two lemmings have the same power when they fight, both of them die.
#
# In the fight between the two races, there are a certain number of battlefields. Each race assigns one lemming for each battlefield, starting with the most powerful. So for example, if a race has 5 lemmings with power {50, 50, 40, 40, 30} and we have 3 battlefields, then a lemming with power 50 will be assigned to battlefield 1, another with 50 power will be assigned to battlefield 2 and last a lemming with power 40 will go to battlefield 3. The other race will do the same.
#
# The Deadly War is processed by having each race send its best soldiers as described to the battle- fields, making a battle round. Then, all battles process at the same time, and some of the lemmings will emerge victorious (but with less power) and some of them will die. The surviving ones will return to their race’s army and then a new round will begin, with each race sending again its best remaining soldiers to the battlefields. If at some point a race does not have enough soldiers to fill all battlefields, then only the ones with soldiers from both races will have a fight.
#
# The Deadly War ends when one of the races has no more lemmings or when both of them disappear at the same time. For example, imagine a war with 2 battlefields and a green army with powers {20,10} and a blue army with powers {10, 10, 15}. The first round will have 20 vs 15 in battlefield 1 and 10 vs 10 in battlefield 2. After these battles, green race will still have a power 5 lemming (that won on battlefield 1) and blue race will have one with power 10 (that did not fight). The ones in battlefield 2 died, since they both had the same power. Afer that comes a second round, and only battlefield 1 will have a fight, being 5 vs 10. The blue lemming wins, killing the last green soldier and giving the victory to the blue race!
#
# But in the real battle, will victory be green or blue?
#
# Given the number of battefields and the armies of both races, your task is to discover which race will win the Deadly War and show the power of the surviving soldiers.
#
# Input
# You are given B, SG and SB, representing respectively the number of battlefields available, a vector of integers size n of lemmings in the green army and a vector of integers size n of lemmings in the blue army (1 ≤ B, SG, SB ≤ 100000).
#
# The lemmings in each army do not need to come in any particular order.
#
# Output
# For each test case you should return :
#
# • "Green and Blue died" if both races died in the same round
#
# • "Green wins : Each surviving soldier in descending order" if the green army won the Deadly War
#
# • "Blue wins : Each surviving soldier in descending order" if the blue army won the Deadly War
#
# Example
# lemming_battle(5, [10], [10]) == "Green and Blue died"
# lemming_battle(2, [20,10], [10,10,15]) == "Blue wins: 5"
# lemming_battle(3, [50,40,30,40,50], [50,30,30,20,60]) == "Green wins: 10 10"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def lemming_battle(f, green, blue)
  g, b = green.sort.reverse, blue.sort.reverse
  loop do
    i = [g.size, b.size, f].min
    res = g[0...i].zip(b[0...i]).map{|x, y| x - y}
    g, b = (g[i..-1] + res.select{|n| n > 0}).sort.reverse, (b[i..-1] + res.select{|n| n < 0}).map(&:abs).sort.reverse
    if g.empty? && b.empty?
      return "Green and Blue died"
    elsif g.empty?
      return "Blue wins: #{b.join(' ')}"
    elsif b.empty?
      return "Green wins: #{g.join(' ')}"
    end
  end
end
