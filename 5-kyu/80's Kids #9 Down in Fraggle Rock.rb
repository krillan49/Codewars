#===============================================================================================================
#                                               Description
#===============================================================================================================

# Down in Fraggle Rock, the gorgs are working on their farm of radishes. They begin to notice that the fraggles have been stealing their radishes, so they set up traps to catch them. The gorgs, however, are not very smart and have been caught up in their traps quite a few times. They have to put out signs in front of every radish, telling their fellow gorgs whether the radish is "safe" (no trap) or "unsafe" (trap!).
#
# Gobo and Wembley, our fraggle heroes, need our help. The gorgs are using a Caesar Cipher (also known as a shift cipher) to encrypt their signs, but they've added a twist. Can you figure it out?
#
# Your function should only return "safe" or "unsafe". You will always be passed a valid string of encrypted alpha characters.
#
# Hint: It's not as simple as just the word length!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def decode(arr, shift)
  arr.map do |c|
    k = ((97 - (c.ord - shift)) /26.0).ceil
    c.ord - shift < 97 ? (c.ord - shift + 26 * k).chr : (c.ord - shift).chr
  end.join
end

def decipher(sign)
  arr = sign.chars
  26.times do |x|
    res = decode(arr, x)
    return res if res == 'safe' or res == 'unsafe'
  end
  sign.size == 4 ? 'unsafe' : 'safe'
end
