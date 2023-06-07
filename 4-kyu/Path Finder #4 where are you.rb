#===============================================================================================================
#                                               Description
#===============================================================================================================

# Hey, Path Finder, where are you?

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. The input contains letters and numbers, letters are left or right turns (large - 2 direction changes, small - 1), numbers - the number of steps in the current direction
#
# 2. One number is all the numeric characters between two letters
#
# 2. Initial direction up.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

URDL=%w[u r d l]
$d = 0
$p = [0, 0]

def i_am_here(path)
  return $p if path==''
  steps = path.chars.chunk_while{|a,b| /\d/ === a && /\d/ === b}.map(&:join).map{|e| /\d/ === e[0] ? e.to_i : e}
  steps.each do |e|
    if e == 'r'
      $d == 3 ? $d = 0 : $d += 1
    elsif e == 'l'
      $d == 0 ? $d = 3 : $d -= 1
    elsif e == 'R'
      $d == 3 ? $d = 1 : $d == 2 ? $d = 0 : $d += 2
    elsif e == 'L'
      $d == 0 ? $d = 2 : $d == 1 ? $d = 3 : $d -= 2
    else
      case URDL[$d]
      when 'u'; $p[0] -= e
      when 'r'; $p[1] += e
      when 'd'; $p[0] += e
      when 'l'; $p[1] -= e
      end
    end
  end
  $p
end
