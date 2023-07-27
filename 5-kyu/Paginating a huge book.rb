#===============================================================================================================
#                                               Description
#===============================================================================================================

# Johnny is working as an intern for a publishing company, and was tasked with cleaning up old code. He is working on a program that determines how many digits are in all of the page numbers in a book with pages from 1 to n (inclusive).
#
# For example, a book with 4 pages has 4 digits (one for each page) while a 12-page book has 15 (9 for 1-9, plus 2 each for 10, 11, 12).
#
# Johnny's boss, looking to futureproof, demanded that the new program be able to handle books up to 400,000,000,000,000,000 pages.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def page_digits(pages)
  return pages if pages < 10
  n, res, pp = 0, 0, 0
  loop do
    if pages - pp > 9 * 10**n
      res += 9 * 10**n * (n+1)
      pp += 9 * 10**n
    else
      return res += (pages - pp) * (n + 1)
    end
    n += 1
  end
end
