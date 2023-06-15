#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your task is to implement a function that calculates an election winner from a list of voter selections using an Instant Runoff Voting algorithm. If you haven't heard of IRV, here's a basic overview (slightly altered for this kata):
#
#   Each voter selects several candidates in order of preference.
#   The votes are tallied from the each voter's first choice.
#   If the first-place candidate has more than half the total votes, they win.
#   Otherwise, find the candidate who got the least votes and remove them from each person's voting list.
#   In case of a tie for least, remove all of the tying candidates.
#   In case of a complete tie between every candidate, return nil(Ruby)/None(Python)/undefined(JS).
#   Start over.
#   Continue until somebody has more than half the votes; they are the winner.
# Your function will be given a list of voter ballots; each ballot will be a list of candidates (symbols) in descending order of preference. You should return the symbol corresponding to the winning candidate. See the default test for an example!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def runoff(voters)
  fild = voters.map{|a| a.map(&:to_sym)}
  candidates = fild.flatten.uniq

  until fild.flatten.empty?
    first = fild.transpose[0]
    counts = first.uniq.map{|e| [e, first.count(e)]}

    maxc = counts.max_by{|a| a[1]}
    max = maxc[1]
    return maxc[0] if max.to_f / fild.size > 0.5

    counts2 = candidates.map{|c| [c, first.count(c)]}
    min = counts2.min_by{|a| a[1]}[1]
    remove = counts2.select{|a| a[1] == min}.map{|a| a[0]}
    candidates = counts2.select{|a| a[1] != min}.map{|a| a[0]}

    fild = fild.map{|a| a.delete_if{|e| remove.include?(e)}}
  end
end
