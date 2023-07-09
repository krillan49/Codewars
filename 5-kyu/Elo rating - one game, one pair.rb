#===============================================================================================================
#                                               Description
#===============================================================================================================

# Calculate a chess player's new Elo rating using their previous ratings (experience), their opponent's rating (opponent), the outcome of the new game (score), and the Factor k function (k).
#
# Arguments
# experience is an array/list containing the history of the player's ratings, with the last item in the array being the current rating. For example, if experience is [995, 1025, 1050], then the player's 2 old ratings are 995 and 1025, and their current rating is 1050. If a player has no recorded experience (experience = []), use 1000 for their rating.
# opponent is a single number indicating the opponent's rating
# score is the outcome of the new game. score is 1 if the player won, 0 if the player lost, or 0.5 if it was a tie.
# k is a function that takes in the experience array/list as an argument. k is an optional argument - sometimes a k function will be passed for you to use and sometimes not. You must write a default k function to use in case no k function is passed (see below for details).
# Return
# The elo function must return the new rating of the player rounded to the nearest integer.
# Elo rating formula
# The Elo rating system starts with an expectation formula:
#
# expectation =
# 1 / (1+10^((opponent_rating - player_rating)/400))
# This can then be used in the new rating formula as follows:
#
# new_player_rating =
# player_rating + k(experience) * (score - expectation)
# Note that k is a function taking in experience as a parameter.
#
# Factor K function
# You must write a default k function to use if no k function is passed to the elo function. The default k function should take in experience as an argument and return the following:
#
# If player is a newbie (less than 30 games of experience), return 25.
# If player is not a newbie, but player's rating has never reached 2400 before, return 15.
# If player is not a newbie and has at least one record of a rating >= 2400, return 10.
# (These are pre-2011 FIDE rules.)
#
# Examples
# Example 1: elo([], 1725, 1)
# Since player has no experience, we will use 1000 as their rating. opponent rating is 1725. score is 1.
#
# Then we have:
#
# expectation
# = 1 / (1+10^((opponent_rating - player_rating)/400))
# = 1 / (1+10^((1725 - 1000)/400))
# = 0.01516572425000013
# Since no k function was passed, we will use our default k function. Since player is a newbie (less than 30 games of experience), k(experience) will return 25.
#
# Then in our new_player_rating formula:
#
# new_player_rating
# = player_rating + k(experience) * (score - expectation)
# = 1000 + 25 * (1 - 0.01516572425000013)
# = 1024.62085689375
# When we round this to the nearest integer our final answer is 1025.
#
# Example 2:
# def k_algo(exp):
#     return 800//len(exp)
#
# elo([1025, 1025, 1050, 1075, 1100, 1125, 1150,
# 1175, 1200, 1225, 1250, 1275, 1300, 1325, 1350,
# 1375, 1400, 1425, 1450, 1475, 1500, 1525, 1550,
# 1575, 1600, 1625, 1650, 1675, 1700, 1725],
# 1000,
# 0,
# k_algo)
# The player's current rating is the last item in experience, 1725. opponent rating is 1000. score is 0. A function called k_algo is passed which we will use instead of our default k function.
#
# Then we have:
#
# expectation
# = 1 / (1+10^((opponent_rating - player_rating)/400))
# = 1 / (1+10^((1000 - 1725)/400))
# = 0.9848342757499998
# When we pass experience to the k_algo function, we will get out 800//len(experience) = 26.
#
# Then in our new_player_rating formula:
#
# new_player_rating
# = player_rating + k(experience) * (score - expectation)
# = 1725 + 26 * (0 - 0.9848342757499998)
# = 1699.3943088305
# When we round this to the nearest integer our final answer is 1699.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

DEFLT = lambda{|p| p.size < 30 ? 25 : p.max < 2400 ? 15 : 10}

def elo(experience, opponent, score, k = DEFLT)
  factor_k = k.call(experience)
  pl_rait = (experience[-1] ? experience[-1] : 1000)
  expectation = 1 / (1 + 10**((opponent - pl_rait) / 400.0).to_f)
  new_player_rating = (pl_rait + factor_k * (score - expectation)).round
end
