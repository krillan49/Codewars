#===============================================================================================================
#                                               Description
#===============================================================================================================

# Complete the LeagueTable class.
#
# The LeagueTable class is used to store results of football (soccer) matches played, as well as return and display various stats about each team.
#
# Match results will always be passed through the push method as a String in the format: "Home Team 0 - 0 Away Team". For example: "Man Utd 3 - 0 Liverpool".
#
# When a new match result is given, points are awarded to teams as follows:
#
# 3 points for a win
# 1 point for a draw
# 0 points for loss
# The class must have the following methods:
#
# push(match_string)             # insert a new match record
#
# get_points(team_name)          # Returns the no. of points a team has, 0 by default
# get_goals_for(team_name)       # Returns the no. of goals a team has scored, 0 by default
# get_goals_against(team_name)   # Returns the no. of goals a team has conceeded (had scored against them), 0 by default
# get_goal_difference(team_name) # Return the no. of goals a team has scored minus the no. of goals a team has conceeded, 0 by default
# get_wins(team_name)            # Return the no. of wins a team has, 0 by default
# get_draws(team_name)           # Return the no. of draws a team has, 0 by default
# get_losses(team_name)          # Return the no. of losses a team has, 0 by default
# For example:
#
# lt = LeagueTable.new
#
# lt.push("Man Utd 3 - 0 Liverpool")
#
# puts lt.get_goals_for("Man Utd") => 3
# puts lt.get_points("Man Utd") => 3
# puts lt.get_points("Liverpool") => 0
# puts lt.get_goal_difference("Liverpool") => -3
#
# lt.push("Liverpool 1 - 1 Man Utd")
#
# puts lt.get_goals_for("Man Utd") => 4
# puts lt.get_points("Man Utd") => 4
# puts lt.get_points("Liverpool") => 1
# puts lt.get_goals_against("Man Utd") => 1
#
# puts lt.get_points("Tottenham") => 0

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class LeagueTable
  def initialize
    @matches = {}
  end

  def push(match_string)
    str_a, str_b = match_string.split(' - ')
    goals_a, name_a = team_game_result(str_a)
    goals_b, name_b = team_game_result(str_b)
    team_game_changes(name_a, goals_a, goals_b)
    team_game_changes(name_b, goals_b, goals_a)
  end

  def method_missing(method, team_name)
    @matches[team_name] ? @matches[team_name][method[4..-1].to_sym] : 0
  end

  private

  def team_game_result(str, goals='', name='')
    str.each_char.with_index{|ch, i| (48..57).include?(ch.ord) ? goals += ch : name += ch }
    [goals.to_i, name.strip!]
  end

  def team_game_changes(name1, goals1, goals2)
    if !@matches[name1]
      @matches[name1] = {goals_for: 0, goals_against: 0, goal_difference: 0, wins: 0, draws: 0, losses: 0, points: 0}
    end
    @matches[name1][:goals_for] += goals1
    @matches[name1][:goals_against] += goals2
    @matches[name1][:goal_difference] += (goals1 - goals2)
    if goals1 - goals2 > 0
      @matches[name1][:wins] += 1
      @matches[name1][:points] += 3
    elsif goals1 - goals2 < 0
      @matches[name1][:losses] += 1
    else
      @matches[name1][:draws] += 1
      @matches[name1][:points] += 1
    end
  end
end
