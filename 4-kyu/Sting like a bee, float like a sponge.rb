#===============================================================================================================
#                                               Description
#===============================================================================================================

# You and your friend created the next great FaceSpace game, SpongeSqueezer! Now if the users would only discover the game and keep playing it, you would be a multi-millionaire.

# After an argument with your friend/partner over the game's quality after the lackluster first day statistics became apparent, you go to sleep for the night while your partner works on some mysterious project. The next morning, you find an email from your partner giving you some bad news.

# Hey buddy,

# After last night, I went back and checked the stats for who was putting in the work over the last 2 months, and was fairly disgusted by your numbers. However I'm willing to chalk it up to burnout and your breakup with Rachel.

# According to our contract and the current commit statistics, I'll get 100% of SpongeSqueezer if we have to break up. I'll have to buy you out, but at the moment, I could do it anytime in the next week for $20. Again, I'm giving you the chance to prove your skills, so please take this seriously.

# All of our players have a credit amount in the database that they can use to buy new sponges. Just a simple integer value, limited to a few thousand. I've obfuscated the values, but the values are 100% recoverable. I've sent 10 examples with this email for you to puzzle out. If you can puzzle out the mechanism I've used to obfuscate the values, I'm willing to give our partnership more time to grow.

# Joe

# P.S. One zero is worth up to 8.

# values = {
#   -750 => "803BC4",
#   -10  => "20C1",
#    0   => "0",
#    5   => "A040",
#    8   => "41",
#    10  => "2041",
#    15  => "7041",
#    70  => "8C42",
#    100 => "C842",
#    750 => "803B44"
# }

#===============================================================================================================
#                                               Explanation
#===============================================================================================================

# My solution is not the best, especially against the background of one-liners, which you will find in the list of solutions when you solve this kata yourself, but maybe you just didn’t have a little hint to solve this kata yourself, so I’ll leave them until the code itself:

# 1. The penultimate character is only responsible for the sign of the final number (C - negative, 4 - positive)

# 2. The last character means to which range the final number belongs (0 - 1..7; 1 - 8..31; 2 - 32..127; 3 - 128..511; 4 - 512.. 2047; 5 -- 2048...).

# 3. The number of patterns for decoding depends on the last character (2 in each, for example, if the last character is 4, then there will be different patterns for the numbers 512..1023 and 1024..2047. The number of patterns also depends on the number of characters, corresponding to different number of characters, even numbers from the same range (eg 512..1023) will have different encoding patterns.
# Although you may be smarter than me and find a single pattern for all numbers)

# 4. The hexadecimal system is used in coding most numbers.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def decrypt_credits(v)
  return 0 if v == '0'
  
  zn=(v[-2] == 'C' ? -1 : 1)

  if v[-1] == '0'
    return 1 * zn if v[-2] != 'C' && v[-2] != '4'
    return 2 * zn if v.size == 2
    return 3 * zn if v[0].to_i(16) < 10
    return v[0].to_i(16) / 2
  end

  if v[-1] == '1'
    return 8 * zn if v.size == 2
    return (8+v[0].to_i) * zn if v[0..-3].to_i(16) / 8 < 16
    return v[0..-3].to_i(16) / 8 * zn
  end

  if v[-1] == '2'
    return v[0..-3].to_i(16) / 2 * zn if v[0..-3].to_i(16) / 4 + 32 > 63  # 64-127
    return (v[0..-3].to_i(16) / 4 + 32) * zn  # 32-63
  end

  if v[-1] == '3'
    return v[0..-3].to_i(16) * 2 * zn if v.size == 4 && v[0..-3].to_i(16) > 127  # 256-511
    return (v[0..-3].to_i(16) + 128) * zn if v.size == 4  # 128-255
    return (v[2..-3].to_i(16) * 2 + 1) * zn if v.size == 6
  end

  if v[-1] == '4' && v.size == 4
    return v[0..-3].to_i(16) * 8 * zn if v[0..-3].to_i(16) > 127 # 1024-2047
    return (v[0..-3].to_i(16) * 4 + 512) * zn  # 512-1023
  elsif v[-1] == '4' && v.size == 6
    return (v[0].to_i(16) / 2 + v[2..3].to_i(16) * 8) * zn if v[0].to_i(16) / 2 + v[2..3].to_i(16) * 8 > 1023 # 1024-2047
    return (v[0].to_i(16) * v[2..3].to_i(16) / (v[0].to_i(16) / 4) + v[0].to_i(16) / 4 + 512) * zn # 512-1023
  end

  if v[-1] == '5'
    return 2048 * zn if v.size == 2
    return (v[0].to_i(16) + v[2..3].to_i(16) * 16 + 2048) * zn if v.size == 6
    return (v[0..-3].to_i(16) * 16 + 2048) * zn if v.size == 4
  end
end
