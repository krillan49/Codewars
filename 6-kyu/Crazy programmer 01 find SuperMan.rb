#===============================================================================================================
#                                               Description
#===============================================================================================================

# Hey, young man, don't look around, I'm talking to you!
#
# I am a programmer, work in this madhouse. my job is research code, and... at the same time I am also the other researcher's study object. There are a lot of the same people and work with me.
#
# My recent research is how to find Superman, because I found that a SuperMan is hidden inside us, we must find him, then let him go to save the planet.
#
# The conclusion of my research: ``` 1. If a person is talking to you, the word 'Superman' appears in the sentence, so he is not a superman. 2. Because Superman usually careful to hide the word 'Superman' in a sentence, and each of the two letters are not continuous. 3. Sometimes Superman will be especially careful, reverse the word, or transform uppercase and lowercase, let others more difficult to find out. ``` Now, I invite you to help me write the code (my hand was injured, there is no way to knock on the keyboard), a function named ```findSuperMan```, can correctly find out who is Superman, and let him wear the red pants and cloak, save our earth!
# output is a string, if find out SuperMan,
# say "Hi, SuperMan!" to him,  otherwise, say "Are you crazy?"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_SuperMan(s)
  r = s.downcase.gsub(/[^SuperMan]/i, ' ').split.select{|e| e.size == 1}.join
  (r.include?('superman') or r.reverse.include?('superman')) ? 'Hi, SuperMan!' : 'Are you crazy?'
end
