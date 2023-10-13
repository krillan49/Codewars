#===============================================================================================================
#                                               Description
#===============================================================================================================

# My pet bridge-maker ants are marching across a terrain from left to right.
#
# If they encounter a gap, the first one stops and then next one climbs over him, then the next, and the next, until a bridge is formed across the gap.
#
# What clever little things they are!
#
# Now all the other ants can walk over the ant-bridge.
#
# When the last ant is across, the ant-bridge dismantles itself similar to how it was constructed.
#
# This process repeats as many times as necessary (there may be more than one gap to cross) until all the ants reach the right hand side.
#
# Kata Task
# My little ants are marching across the terrain from left-to-right in the order A then B then C...
#
# What order do they exit on the right hand side?
#
# Notes
# - = solid ground
# . = a gap
# The number of ants may differ but there are always enough ants to bridge the gaps
# The terrain never starts or ends with a gap
# Ants cannot pass other ants except by going over ant-bridges
# If there is ever ambiguity which ant should move, then the ant at the back moves first
# Example
# Input
# ants = GFEDCBA
# terrain = ------------...-----------
# Output
# result = EDCBAGF
# Details
# Ants moving left to right.
# GFEDCBA
# ------------...-----------
# The first one arrives at a gap.
# GFEDCB     A
# ------------...-----------
# They start to bridge over the gap...
# GFED       ABC
# ------------...-----------
# ...until the ant-bridge is completed!
# GF         ABCDE
# ------------...-----------
# And then the remaining ants can walk across the bridge.
#                F
# G          ABCDE
# ------------...-----------
# And when no more ants need to cross...
#            ABCDE        GF
# ------------...-----------
# ... the bridge dismantles itself one ant at a time....
#
#              CDE      BAGF
# ------------...-----------
# ...until all ants get to the other side
#
#                    EDCBAGF
# ------------...-----------

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def ant_bridge(ants, terrain)
  ants, size, t, finish = ants.chars, ants.size, terrain.chars.map{|k| [k, nil]}, []
  until finish.size == size
    if ants.size > 0
      ant = ants.pop
    else
      j = t.index{|c, a| a}
      ant = t[j][1]
      if t.size > 1
        t = t[j+1..-1]
      else
        finish.unshift(ant)
        break
      end
    end
    t.each_with_index do |(c, a), i|
      if c == '.' && !a
        t[i-1][1] ? t[i][1] = ant : t[i-1][1] = ant
        break
      elsif c == '-' && !a && t[i-1][0] == '.' && /[A-Z]/ === t[i-1][1]
        t[i][1] = ant
        break
      elsif i == t.size - 1
        finish.unshift(ant)
      end
    end
  end
  finish.join
end
