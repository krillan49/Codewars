#===============================================================================================================
#                                               Description
#===============================================================================================================

# Relations :
# The following challenge is partially related to two already existing Kata's. But is differnt in the sense that neither approach will work here and this is a more performance version as well. Links :
#
# number1 , number2. OK last one maybe not.
#
# Challenge :
# You are given an integer n as input. Your job is to create a diamond that is 2x the given number n.
#
# Input :
# Input is integer n and n > 2 ≤ 3000.
#
# Output :
# Output will be a string and it will be in form of a diamond consisting of + with an addition line at the start showing n using +
#
# Examples :
# D(3) :
#
# +++
#   +
#  +++
# +++++
# +++++
#  +++
#   +
#
# D(5) :
#
# +++++
#     +
#    +++
#   +++++
#  +++++++
# +++++++++
# +++++++++
#  +++++++
#   +++++
#    +++
#     +
# Restrictions :
# This is code-golf so there is a limit.
#
# Javascript solutions are limited to less than 111 characters.
#
# Python solution are limited to less than 89 characters
#
# Ruby solution are limited to less than 82 characters
#
# All limits are exlusive

#===============================================================================================================
#                                               Solution
#===============================================================================================================

D=->n{a=(1..n).map{|e|' '*(n-e)+'+'*(e*2-1)};(['+'*n]+a+a.reverse).join("\n")}
