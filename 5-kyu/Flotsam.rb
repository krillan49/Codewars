#===============================================================================================================
#                                               Description
#===============================================================================================================

# Frank, Sam and Tom build the ship. Then they went on a voyage. This was not a good idea, because the ship crashed on an iceberg and started sinking. Your job is to save the survivors.
#
# Details
# The crash scheme looks like an ASCII picture
#
#          |-| |-| |-|
#          | | | | | |
# ~\-------|-|-|-|-|-|------/~
# ~~\   F   |   S   |   T  /~~
# ~~~\----------------x---/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# where:
#
# The letters F, S, and T are passengers;
# ~ is water;
# spaces are empty space;
# x - hit location. There can be several hits;
# any other signs are parts of the ship.
# Before the collision, all passengers were inside confined spaces. After collision, water can only spread in orthogal directions (up, left, right and down, not diagonally, and not higher than ocean level), in empty spaces according to the picture:
#
#          |-| |-| |-|                       |-| |-| |-|                       |-| |-| |-|
#          | | | | | |                       | | | | | |                       | | | | | |
# ~\-------|-|-|-|-|-|------/~      ~\-------|-|-|-|-|-|------/~      ~\-------|-|-|-|-|-|------/~
# ~~\   F   |   S   | ~ T  /~~ ---> ~~\   F   |   S   |~~~T  /~~ ---> ~~\   F   |   S   |~~~~~~/~~
# ~~~\----------------~---/~~~      ~~~\----------------~---/~~~      ~~~\----------------~---/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~┴~~
# People in the non-flooded spaces survived.
#
# Input
# An image of the incident, presented as a 2D array of symbols. To aid in the rescue operation, it is translated into a picture. We can also assume that the first column of the picture contains only water and air and can be used to determine the ocean level.
#
# Output
# The names of the survivors in the string. In the description example it would be Frank Sam. Unfortunately, Tom is gone.
#
# Examples
# It's okay:
#
#           |==|  |==|  |==|                          |==|  |==|  |==|
#         __|__|__|__|__|__|_                       __|__|__|__|__|__|_
#      __|___________________|___                __|___________________|___
#   __|__[]__[]__[]__[]__[]__[]__|_xxx        __|__[]__[]__[]__[]__[]__[]__|_
# ~|   F     S    |  T              /~ ---> ~|   F     S    |  T              /~
# ~|______________x________________/~~      ~|______________~________________/~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# It's almost okay:
#
#           |==|  |==|  |==|                          |==|  |==|  |==|
#         __|__|__|__|__|__|_                       __|__|__|__|__|__|_
#      __|___________________|___                __|___________________|___
#   __|__[]__[]__[]__[]__[]__[]__|___         __|__[]__[]__[]__[]__[]__[]__|___
# ~|   F     S    |  T              /~ ---> ~|~~~~~~~~~~~~~~|  T              /~
# ~x____________x_|________________/~~      ~~____________~_|________________/~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Something's wrong:
#
#          |-| |-| |-|                       |-| |-| |-|
#          | | | | | |                       | | | | | |
# ~\-------|-|-|-|-|-|------/~      ~\-------|-|-|-|-|-|------/~
# ~~\   F   |   S   x   T  /~~ ---> ~~\   F   |~~~~~~~~~~~~~~/~~
# ~~~\--------------x-----/~~~      ~~~\--------------~-----/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Not this time, Poseidon:
#
#          |-| |-| |-|                       |-| |-| |-|
#          | | | | | |                       | | | | | |
# ~\-x-----|-|-|-|-|-|-----xx~      ~\- -----|-|-|-|-|-|-----~~~
# ~~\   F   x   S   |   T  /~~ ---> ~~\   F       S   |   T  /~~
# ~~~\--------------------/~~~      ~~~\--------------------/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This time:
#
#          |-| |-| |-|                       |-| |-| |-|
#          | | | | | |                       | | | | | |
# ~\-------|-|-|-|-|-|----xxx~      ~\-------|-|-|-|-|-|----~~~~
# ~~\   F   |   S   x   T  /~~ ---> ~~\   F   |~~~~~~~~~~~~~~/~~
# ~~~\--------------------/~~~      ~~~\--------------------/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Playing Another card game:
#
#          |-| |-| |-|                       |-| |-| |-|
#          | | | | | |                       | | | | | |
# ~\-------|-|-|-|-|-|------/~      ~\-------|-|-|-|-|-|------/~
# ~~\ F S T |       |      /~~ ---> ~~\ F S T |~~~~~~~|      /~~
# ~~~\---------xxx--------/~~~      ~~~\---------~~~--------/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Yellow submarine:
#
#
# ~~~~~~~~~|---------x~~~~~~~~      ~~~~~~~~~|---------~~~~~~~~~
# ~~~~~~~~~|         x~~~~~~~~      ~~~~~~~~~|~~~~~~~~~~~~~~~~~~
# ~\-------|---------|------/~      ~\-------|---------|------/~
# ~~\   F   |   S   |   T  /~~ ---> ~~\   F   |   S   |   T  /~~
# ~~~\--------------------/~~~      ~~~\--------------------/~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def flotsam(image)
  sealine = image.index{|a| a[0] == '~'}
  image = image.map{|arr| arr.map{|e| e == 'x' ? ' ' : e}}
  counter0, counter = nil, 0
  until counter0 == counter
    counter0 = counter
    image.each.with_index do |arr, i|
      arr.each.with_index do |e, j|
        if e == '~'
          if i > 0 && sealine < i && [' ', 'F', 'S', 'T'].include?(image[i-1][j])
            image[i-1][j]='~'
            counter += 1
          end
          if j > 0 && [' ', 'F', 'S', 'T'].include?(image[i][j-1])
            image[i][j-1] = '~'
            counter += 1
          end
          if i < image.size - 1 && [' ', 'F', 'S', 'T'].include?(image[i+1][j])
            image[i+1][j] = '~'
            counter += 1
          end
          if j < arr.size - 1 && [' ', 'F', 'S', 'T'].include?(image[i][j+1])
            image[i][j+1] = '~'
            counter += 1
          end
        end
      end
    end
  end
  image.flatten.each.with_object([]){|e, res|
    res[0] = 'Frank' if e == 'F'
    res[1] = 'Sam' if e == 'S'
    res[2] = 'Tom' if e == 'T'
  }.compact.join(' ')
end
