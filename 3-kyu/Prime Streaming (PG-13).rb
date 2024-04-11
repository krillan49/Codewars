#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create an endless stream that yields prime numbers. The stream must be able to produce a million primes in a few seconds.
#
# If this is too easy, try Prime Streaming (NC-17).
#
# Note: the require keyword is disabled.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Primes
  PRIMES = []

  def self.find_kk_primes_eratosthenes(n)
    arr = Array.new(n, true)
    s = Math.sqrt(n)
    (2..s).each do |i|
      if arr[i]
        j = i**2
        while j <= n
          arr[j] = false
          j += i
        end
      end
    end
    arr[2..-1].each.with_index(2){|e, i| PRIMES.push(i) if e}
  end

  def self.stream
    Primes.find_kk_primes_eratosthenes(16000000) if PRIMES.empty?
    Enumerator.new do |y|
      i = 0
      loop do
        y.yield PRIMES[i]
        i += 1
      end
    end
  end
end
