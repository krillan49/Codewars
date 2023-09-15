#===============================================================================================================
#                                               Description
#===============================================================================================================

# Countries such as the U.S. and China use a dot to represent a decimal point, they also use a comma to seperate groups of thousands e.g. 4,353.56
#
# Other countries (mostly in Europe) instead use a comma to represent a decimal point, they also use a dot to seperate groups of thousands e.g. 4.353,56
#
# Your task is to sum up an array of string repensentation of numbers being in one of the two formats mentioned above with AT MOST two decimal places. The resulted sum should be a string with the format of xx,xxx.xx (keep two decimal places, seperate groups of thousands with comma if necessary)
#
# This Kata is inspired by one of the bugs that almost happened due to the differences in number formatting ( •̀ω•́ )σ

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sum_up_numbers(arr)
  s = "#{'%.2f' % arr.sum{|n| n.gsub(/,(\d{1,2})$/, '.\1').gsub(/[.,](\d{3,})/, '\1').to_f}}"
  s.split('.')[0].reverse.chars.each_slice(3).map(&:join).join(',').reverse + '.' + s.split('.')[1]
end
