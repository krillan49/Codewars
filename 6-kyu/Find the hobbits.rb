#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are a lonely hobbit, and you've been given a manifest of all the residents in this side of the country. The manifest is an array of hashes, that have the form: {name: 'string', race: 'string', home: 'string'}
#
# You want to find all of the other hobbits! Your task is to return an array from a given manifest that contains all of the potential halflings in the list. From your experience you know that hobbits don't always follow the rules, and some may have entered their race under their home and vice versa. You also know that some hobbits will refer to themselves as halflings, and that popular homes for hobbits include the shire, south farthing, and hobbiton.
#
# TLDR; For a given array of hashes of the form {name: 'string', race: 'string', home: 'string'}, return an array of all the objects that have the words halfling,hobbit,shire,farthing, or hobbiton anywhere within the race or home field.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_hobbits_in(manifest)
  manifest.select do |hh|
    hh.values.compact.any? do |v|
      ['halfling', 'hobbit', 'shire', 'farthing', 'hobbiton'].any?{|w| v.downcase.split(/[^a-z]/).include?(w)}
    end
  end
end
