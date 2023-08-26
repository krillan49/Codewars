#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement an algorithm which receives the integers a and b and returns the result of the integer division a / b. Your algorithm must do this without using either the "/" or "*" operators.
#
# Watch out for performance. Does your algorithm run fast if a is very large and b is small? If it does not, the tests may timeout...

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def divide(a, b)
  return 0 if a == 0
  k = [a, b].all?(&:positive?) || [a, b].all?(&:negative?) ? 1 : -1
  a, b = a.abs, b.abs
  digs = a.digits.reverse
  res = digs.each.with_index do |n, i|
    10.times{ digs[i+1] += n % b } if i != digs.size - 1
    m = digs[i] - n % b
    counter = 0
    until m <= 0
      m -= b
      counter += 1
    end
    digs[i] = counter
  end
  .join.to_i
  k == -1 ? -res : res
end
