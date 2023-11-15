#===============================================================================================================
#                                               Description
#===============================================================================================================

# Compute the complex logarithm at any given complex number, accurate to at least 1 in 10^-12. The imaginary part should be inside the interval (−π, π] (i.e if the imaginary part is exactly π, keep it as is).
#
# Note: You shouldn't try to compute the value of this function at the poles. Please return null/NULL/nil/None (C#: throw an ArgumentException, Java: throw an ArithmeticException) if this happens.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def log(real, imag)
  r = Math.log((real**2 + imag**2)**0.5)
  return nil if r.abs > 999999999
  i0 = Math.atan(imag.to_f / real)
  [r, (real < 0 && imag < 0) ? i0 - Math::PI : (real < 0 && imag >= 0) ? i0 + Math::PI : i0]
end
