#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given Points A, B, C ∈ ℤ**2 and dA, dB, dC ∈ ℤ their respective squared euclidian distances to a certain point P ∈ ℤ**2, return the value of P.
#
# Note
# A, B, and C will always be distinct and non-collinear

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def triangulate(a, da, b, db, c, dc)
  xa, ya = a # da = (xa-xp)**2 + (ya-yp)**2 = xp**2 + yp**2 - 2*xa*xp - 2*ya*yp + xa**2 + ya**2
  xb, yb = b # db = (xb-xp)**2 + (yb-yp)**2 = xp**2 + yp**2 - 2*xb*xp - 2*yb*yp + xb**2 + yb**2
  xc, yc = c # dc = (xb-xp)**2 + (yb-yp)**2 = xp**2 + yp**2 - 2*xc*xp - 2*yc*yp + xc**2 + yc**2

  # da - db = xp*2*(xb - xa) + yp*2*(yb - ya) + (xa**2 + ya**2 - xb**2 - yb**2)
  # db - dc = xp*2*(xc - xb) + yp*2*(yc - yb) + (xb**2 + yb**2 - xc**2 - yc**2)

  # xp = ((da - db - xa**2 - ya**2 + xb**2 + yb**2) - yp*(2*(yb - ya))) / 2*(xb - xa)
  k1 = da - db - xa**2 - ya**2 + xb**2 + yb**2
  n1 = 2*(yb - ya)
  m1 = 2*(xb - xa)
  # xp = (k1 - yp*n1) / m1

  # xp = ((db - dc - xb**2 - yb**2 + xc**2 + yc**2) - yp*(2*(yc - yb))) / 2*(xc - xb)
  k2 = db - dc - xb**2 - yb**2 + xc**2 + yc**2
  n2 = 2*(yc - yb)
  m2 = 2*(xc - xb)
  # xp = (k2 - yp*n2) / m2

  # (k1 - yp*n1) / m1 = (k2 - yp*n2) / m2
  yp = (k2*m1 - k1*m2) / (n2*m1 - n1*m2)
  xp = (k1 - yp*n1) / m1
  [xp, yp]
end
