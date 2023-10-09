#===============================================================================================================
#                                               Description
#===============================================================================================================

# In case you might be unlucky enough not to know the best dark fantasy franchise ever, Berserk tells the story of a man that, hating gratuitous violence, decided to become a mercenary (thus one who sells violence, no gratuity anymore!) and starts an epic struggle against apparently unsormountable odds, unsure if he really wants to pursue a path of vengeance or to try to focus on his remaining and new loved ones.
#
#
# *The main character, Gatsu,
# ready to start yet another Tuesday
#
# *
# Ok, the first part was a joke, but you can read more about the tale of the main character, a "Byronic hero" for wikipedia, in other pages like here.
#
# After an insanely long waiting, finally fans got the follow up of the acclaimed 90s show.
#
# Regrettably, while the first adaption was considerably shortened, the latter was quite butchered, missing entire parts, like the "lost children" arc, but that would have actual children butchered and thus you might get why it was decided to skip it. And fan could somehow cope with it, if it was not for the very meager use of CG (Computer Graphic).
#
# Luckily, I am a simple man and every time Gatsu swings his humongous sword, that is enough to make me forget about everything else.
#
# Your goal is to build a Berserk Rater function that takes an array/list of events of each episode (as strings) and calculate a rating based on that: you start with a score of 0 (hey, it's a work from Miura-sensei, I have great expectations to satisfy!) and you have to:
#
# subtract 2 each time "CG" is mentioned (case insensitive);
# add 5 every time "Clang" is mentioned (case insensitive);
# if a sentence has both "Clang" and "CG", "Clang" wins (add 5);
# remove 1 every time neither is mentioned (I get bored easily, you know, particularly if you remove important parts and keep side character whining for half an episode).
# You should then return a string, structured like this:
#
# if the finale score is less than 0: "worstest episode ever";
# if the score is between 0 and 10: the score itself, as a string;
# if the finale score is more than 10: "bestest episode ever".
# Examples:
#
# berserk_rater(["is this the CG from a P2 game?","Hell, no! Even the CG in the Dreamcast game was more fluid than this!","Well, at least Gatsu does his clang even against a mere rabbit", "Hey, Cosette was not in this part of the story!", "Ops, everybody dead again! Well, how boring..."])=="worstest episode ever"
# berserk_rater(["missing the Count arc","lame CG","Gatsu doing its clang against a few henchmen", "even more lame CG"])=="0"
# berserk_rater(["Farnese unable to shut the fuck up","awful CG dogs assaulting everybody", "Gatsu clanging the pig apostle!"])=="2"
# berserk_rater(["spirits of the dead attacking Gatsu and getting clanged for good", "but the wheel spirits where really made with bad CG", "Isidoro trying to steal the dragon Slayer and getting a sort of clang on his face", "Gatsu vs. the possessed horse: clang!", "Farnese whining again...","a shame the episode ends with that scrappy CG"])=="10"
# berserk_rater(["Holy chain knights being dicks", "Serpico almost getting clanged by Gatsu, but without losing his composure","lame CG","Luka getting kicked","Gatsu going clang against the angels", "Gatsu clanging vs Mozgus, big time!"])=="bestest episode ever"
# Extra cookies if you manage to solve it all using a reduce/inject approach.
#
# Oh, and in case you might want a taste of clang to fully understand it, click (one of the least gory samples I managed to find).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def berserk_rater(synopsis)
  sum = 0
  synopsis.each{|s| sum += s.downcase.include?('clang') ? 5 : s.downcase.include?('cg') ? -2 : -1}
  sum < 0 ? 'worstest episode ever' : sum > 10 ? 'bestest episode ever' : sum.to_s
end
