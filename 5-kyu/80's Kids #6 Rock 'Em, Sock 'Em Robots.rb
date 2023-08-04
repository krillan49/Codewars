#===============================================================================================================
#                                               Description
#===============================================================================================================

# You and your friends have been battling it out with your Rock 'Em, Sock 'Em robots, but things have gotten a little boring. You've each decided to add some amazing new features to your robot and automate them to battle to the death.
#
# Each robot will be represented by an object. You will be given two robot objects, and an object of battle tactics and how much damage they produce. Each robot will have a name, hit points, speed, and then a list of battle tacitcs they are to perform in order. Whichever robot has the best speed, will attack first with one battle tactic.
#
# Your job is to decide who wins.
#
# Example:
#
# robot1 = {
#   "name" => "Rocky",
#   "health" => 100,
#   "speed" => 20,
#   "tactics" => ["punch", "punch", "laser", "missile"]
#  }
#  robot2 = {
#    "name" => "Missile Bob",
#    "health" => 100,
#    "speed" => 21,
#    "tactics" => ["missile", "missile", "missile", "missile"]
#  }
#  tactics = {
#    "punch" => 20,
#    "laser" => 30,
#    "missile" => 35
#  }
#
#  fight(robot1, robot2, tactics) # "Missile Bob has won the fight."
# robot2 uses the first tactic, "missile" because he has the most speed. This reduces robot1's health by 35. Now robot1 uses a punch, and so on.
#
# Rules
#
# A robot with the most speed attacks first. If they are tied, the first robot passed in attacks first.
# Robots alternate turns attacking. Tactics are used in order.
# A fight is over when a robot has 0 or less health or both robots have run out of tactics.
# A robot who has no tactics left does no more damage, but the other robot may use the rest of his tactics.
# If both robots run out of tactics, whoever has the most health wins. Return the message "{Name} has won the fight."
# If both robots run out of tactics and are tied for health, the fight is a draw. Return "The fight was a draw."

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def fight(r1, r2, t)
  r1["tactics"], r2["tactics"] = r1["tactics"].map{|e| [t[e], 1]}, r2["tactics"].map{|e| [t[e], 2]}
  x, y = [r1, r2].map.with_index{|e, i| [e, i]}.sort_by{|a| [-a[0]["speed"], a[1]]}.map(&:first)
  i = 0
  until !x["tactics"][i] && !y["tactics"][i]
    y["health"] -= x["tactics"][i][0] if x["tactics"][i]
    return "#{x["name"]} has won the fight." if y["health"] <= 0
    x["health"] -= y["tactics"][i][0] if y["tactics"][i]
    return "#{y["name"]} has won the fight." if x["health"] <= 0
    i += 1
  end
  if x["health"] > y["health"]
    "#{x["name"]} has won the fight."
  elsif x["health"] < y["health"]
    "#{y["name"]} has won the fight."
  else
    "The fight was a draw."
  end
end
