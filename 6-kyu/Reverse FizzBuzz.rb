#===============================================================================================================
#                                               Description
#===============================================================================================================

# FizzBuzz is often one of the first programming puzzles people learn. Now undo it with reverse FizzBuzz!
#
# Write a function that accepts a string, which will always be a valid section of FizzBuzz. Your function must return an array that contains the numbers in order to generate the given section of FizzBuzz.
#
# Notes:
#
# If the sequence can appear multiple times within FizzBuzz, return the numbers that generate the first instance of that sequence.
# All numbers in the sequence will be greater than zero.
# You will never receive an empty sequence.
# Examples
# reverse_fizzbuzz("1 2 Fizz 4 Buzz")        -->  [1, 2, 3, 4, 5]
# reverse_fizzbuzz("Fizz 688 689 FizzBuzz")  -->  [687, 688, 689, 690]
# reverse_fizzbuzz("Fizz Buzz")              -->  [9, 10]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def reverse_fizzbuzz(s)
  return [3] if s == 'Fizz'
  return [5] if s == 'Buzz'
  return [15] if s == 'FizzBuzz'
  return [5,6] if s == 'Buzz Fizz'
  return [9,10] if s == 'Fizz Buzz'
  a = s.split.map{|e| e == 'Fizz' ? 3 : e == 'Buzz' ? 5 : e == 'FizzBuzz' ? 15 : e}
  return a.map(&:to_i) if a.all?{|e| e.class == String}
  res = a.each_with_index do |e, i|
    if e.class == Integer
      a[i] = i != a.size-1 && a[i+1].class == String ? a[i+1].to_i / e * e : (a[i-1].to_i / e + 1)*e
    end
  end.map(&:to_i)
  res[0] = res[1]-1
  res
end
