#===============================================================================================================
#                                               Description
#===============================================================================================================

# Following from the previous kata and taking into account how cool psionic powers are compare to the Vance spell system (really, the idea of slots to dumb down the game sucks, not to mention that D&D became a smash hit among geeks, so...), your task in this kata is to create a function that returns how many power points you get as a psion [because psions are the coolest, they allow for a lot of indepth tactic playing and adjusting for psychic warriors or wilders or other non-core classes would be just an obnoxious core].
#
# Consider both the psion power points/days table and bonus power points to figure out the correct reply, returned as an integer; the usual interpretation is that bonus power points stop increasing after level 20, but for the scope of this kata, we will pretend they keep increasing as they did before.
#
# To compute the total, you will be provided, both as non-negative integers:
#
# class level (assume they are all psion levels and remember the base power points/day halts after level 20)
# manifesting attribute score (Intelligence, to be more precise) to determine the total, provided the score is high enough for the character to manifest at least one power.
# Some examples:
#
# psion_power_points(1,0) == 0
# psion_power_points(1,10) == 0
# psion_power_points(1,11) == 2
# psion_power_points(1,20) == 4
# psion_power_points(21,30) == 448
# Note: I didn't explain things in detail and just pointed out to the table on purpose, as my goal is also to train the pattern recognition skills of whoever is going to take this challenges, so do not complain about a summary description. Thanks :)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

PSD = [0,2,6,11,17,25,35,46,58,72,88,106,126,147,170,195,221,250,280,311,343]

def psion_power_points(level,score)
  return 0 if score <= 10 or level == 0
  psd = (level >= 20 ? PSD[20] : PSD[level])
  sc = ((score - 11) / 2.0).ceil
  bonus = (sc.odd? ? (1..level).map{|l| l.odd? ? sc/2 : sc/2+1}.sum : level*sc/2)
  psd + bonus
end
