#===============================================================================================================
#                                               Description
#===============================================================================================================

# Gratipay helps fund open source projects by providing a platform for weekly tips/donations. The current homepage lists all projects, along with images. Due to an ever-increasing number of projects, Gratipay is now hitting scaling problems! Help Gratipay design a solution such that only a handful of 'featured' projects are displayed on the homepage.
#
# At the heart of this solution, lies a single function:
#
# def get_featured_projects(all_projects)
#   ...
# end
# all_projects is an array of projects, which are dictionaries/hashes of the format:
#
# {
#   name: "Project name",
#   nreceiving_from: 10,
#   receiving:  10,
# }
# get_featured_projects/getFeaturedProjects is expected to filter out a list of featured projects, based on the following specification:
#
# Always return 10 projects or less.
# Seven of the projects should be drawn randomly from a pool of the popular projects (a project with nreceiving_from > 5 is considered as popular). The remaining three should be taken randomly from amongst the rest.
# If there are less than 10 projects in total, just return all projects.
# If there are less than 7 popular projects, or less than 3 unpopular projects, fill the gaps from the other group of projects if possible.
# Randomize the order of results so that the popular projects don't always appear on top
# Note: Gratipay's codebase is open source, try to resist the temptation to cheat!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_featured_projects(projects)
  return projects if projects.size < 11
  pop = projects.select{|hh| hh[:nreceiving_from] > 5}.shuffle
  unp = projects.select{|hh| hh[:nreceiving_from] < 6}.shuffle
  (pop.size < 7 ? pop + unp[0..2+7-pop.size] : unp.size < 3 ? pop[0..6+3-unp.size] + unp : pop[0..6] + unp[0..2]).shuffle
end
