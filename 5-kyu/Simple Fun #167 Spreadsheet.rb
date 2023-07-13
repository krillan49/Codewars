#===============================================================================================================
#                                               Description
#===============================================================================================================

# John is new to spreadsheets. He is well aware of rows and columns, but he is not comfortable with spreadsheets numbering system.
#
#  Spreadsheet        Row Column A1                 R1C1 D5                 R5C4 AA48               R48C27 BK12               R12C63 Since John has a lot of work to do both in row-column and spreadsheet systems, he needs a program that converts cell numbers from one system to another.
#
# Example
# For s = "A1", the result should be "R1C1".
#
# For s = "R48C27", the result should be "AA48".
#
# Input/Output
#
# [input] string s
#
# The position (in spreadsheet or row-column numbering system).
#
# Spreadsheet : A1 to CRXO65535
#
# Row-Column: R1C1 to R65535C65535
#
# [output] a string
# The position (in the opposite format; if input was in spreadsheet system, the output should be int row-column system, and vise versa).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def spreadsheet(s)
  a = s.chars.slice_when{|x, y| /[0-9]/ === x && /[A-Z]/ === y}.to_a
  if a.size == 1
    a = a.flatten.slice_when{|x, y| /[A-Z]/ === x && /[0-9]/ === y}.to_a
    'R' + a[1].join + 'C' + a[0].reverse.map.with_index{|c, i| 26**i * (c.ord - 64)}.sum.to_s
  else
    n = a[1][1..-1].join.to_i
    res = Math.log(n, 26).floor.downto(0).each_with_object([]){|i, arr| arr << n / 26**i; n %= 26**i}
    res.each.with_index{|e, i| (res[i-1] -= 1; res[i] = 26) if e == 0}
    res.reject(&:zero?).map{|e| (e + 64).chr}.join + a[0][1..-1].join
  end
end
