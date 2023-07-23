#===============================================================================================================
#                                               Description
#===============================================================================================================

# This is the first of my "-nacci" series. If you like this kata, check out the zozonacci sequence too.
#
# Task
# Mix -nacci sequences using a given pattern p.
# Return the first n elements of the mixed sequence.
# Rules
# The pattern p is given as a list of strings (or array of symbols in Ruby) using the pattern mapping below (e. g. ['fib', 'pad', 'pel'] means take the next fibonacci, then the next padovan, then the next pell number and so on).
# When n is 0 or p is empty return an empty list.
# If n is more than the length of p repeat the pattern.
# Examples
#             0  1  2  3  4
# ----------+------------------
# fibonacci:| 0, 1, 1, 2, 3 ...
# padovan:  | 1, 0, 0, 1, 0 ...
# pell:     | 0, 1, 2, 5, 12 ...
#
# pattern = ['fib', 'pad', 'pel']
# n = 6
# #          ['fib',        'pad',      'pel',   'fib',        'pad',      'pel']
# # result = [fibonacci(0), padovan(0), pell(0), fibonacci(1), padovan(1), pell(1)]
# result = [0, 1, 0, 1, 0, 1]
#
# pattern = ['fib', 'fib', 'pel']
# n = 6
# #          ['fib', 'fib', 'pel', 'fib', 'fib', 'pel']
# # result = [fibonacci(0), fibonacci(1), pell(0), fibonacci(2), fibonacci(3), pell(1)]
# result = [0, 1, 0, 1, 2, 1]
# Sequences
# fibonacci : 0, 1, 1, 2, 3 ...
# padovan: 1, 0, 0, 1, 0 ...
# jacobsthal: 0, 1, 1, 3, 5 ...
# pell: 0, 1, 2, 5, 12 ...
# tribonacci: 0, 0, 1, 1, 2 ...
# tetranacci: 0, 0, 0, 1, 1 ...
# Pattern mapping
# 'fib' -> fibonacci
# 'pad' -> padovan
# 'jac' -> jacobstahl
# 'pel' -> pell
# 'tri' -> tribonacci
# 'tet' -> tetranacci
# If you like this kata, check out the zozonacci sequence.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

$fib = [0, 1, 1, 2, 3] # F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.
$pad = [1, 0, 0, 1, 0] # a(n) = a(n-2) + a(n-3) with a(0) = 1, a(1) = a(2) = 0
$jac = [0, 1, 1, 3, 5] # a(n) = a(n-1) + 2*a(n-2), with a(0) = 0, a(1) = 1
$pel = [0, 1, 2, 5, 12] # a(n) = 2*a(n-1) + a(n-2); for n > 1  a(0) = 0, a(1) = 1
$tri = [0, 0, 1, 1, 2] # a(n) = a(n-1) + a(n-2) + a(n-3)  for n >= 3 with a(0) = a(1) = 0 and a(2) = 1.
$tet = [0, 0, 0, 1, 1] # a(n) = a(n-1) + a(n-2) + a(n-3) + a(n-4)  for n >= 4 with a(0) = a(1) = a(2) = 0 and a(3) = 1.

def fib(n)
  return $fib[n] if $fib.size > n
  $fib << $fib[-1] + $fib[-2] until $fib.size > n
  $fib[-1]
end

def pad(n)
  return $pad[n] if $pad.size > n
  $pad << $pad[-2] + $pad[-3] until $pad.size > n
  $pad[-1]
end

def jac(n)
  return $jac[n] if $jac.size > n
  $jac << $jac[-1] + $jac[-2] * 2 until $jac.size > n
  $jac[-1]
end

def pel(n)
  return $pel[n] if $pel.size > n
  $pel << $pel[-1] * 2 + $pel[-2] until $pel.size > n
  $pel[-1]
end

def tri(n)
  return $tri[n] if $tri.size > n
  $tri << $tri[-1] + $tri[-2] + $tri[-3] until $tri.size > n
  $tri[-1]
end

def tet(n)
  return $tet[n] if $tet.size > n
  $tet << $tet[-1] + $tet[-2] + $tet[-3] + $tet[-4] until $tet.size > n
  $tet[-1]
end

def mixbonacci(pattern, length)
  return [] if pattern == [] or length == 0
  pattern = pattern * (length / pattern.size + 1) if pattern.size < length
  pattern = pattern[0..length-1]
  pattern = pattern.map.with_index{|e, i| [e, pattern[0...i].count(e)]}
  pattern.each_with_object([]){|arr, res| res << send(arr[0], arr[1])}
end
