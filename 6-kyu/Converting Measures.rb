#===============================================================================================================
#                                               Description
#===============================================================================================================

# Mary wrote a recipe book and is about to publish it, but because of a new European law, she needs to update and include all measures in grams.
#
# Given all the measures in tablespoon (tbsp) and in teaspoon (tsp), considering 1 tbsp = 15g and 1 tsp = 5g, append to the end of the measurement the biggest equivalent integer (rounding up).
#
# Examples
# "2 tbsp of butter"    -->  "2 tbsp (30g) of butter"
#
# "1/2 tbsp of oregano" -->  "1/2 tbsp (8g) of oregano"
#
# "1/2 tsp of salt"     -->  "1/2 tsp (3g) of salt"
#
# "Add to the mixing bowl and coat well with 1 tbsp of olive oil & 1/2 tbsp of dried dill" -->
# "Add to the mixing bowl and coat well with 1 tbsp (15g) of olive oil & 1/2 tbsp (8g) of dried dill"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def convert_recipe(recipe)
  r = recipe.split
  r.each_with_index do |w, i|
    if w == 'tbsp' || w == 'tsp'
      n = w == 'tbsp' ? 15 : 5
      r[i-1] = if r[i-1].include?('/')
        "#{r[i-1]} #{w} (#{(n * r[i-1].split('/')[0].to_f / r[i-1].split('/')[1].to_f).ceil}g)"
      else
        "#{r[i-1]} #{w} (#{n * r[i-1].to_i}g)"
      end
      r[i] = nil
    end
  end.compact.join(' ')
end
