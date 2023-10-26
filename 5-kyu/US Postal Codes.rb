#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given the name of a US state or territory, return its postal abbreviation. All states, federal districts and inhabited territories will be tested, according to the linked wikipedia page.
#
# Notes:
#
# to spark your creativity, the size of your code is limited to 500 characters
# the list of states and their respective abbreviations are listed below
# require, exec, and eval are forbidden
# Examples
# "Alabama"               -->  "AL"
# "District of Columbia"  -->  "DC"
# "U.S. Virgin Islands"   -->  "VI"
# List of states and abbreviations
# Alabama, AL
# Alaska, AK
# Arizona, AZ
# Arkansas, AR
# California, CA
# Colorado, CO
# Connecticut, CT
# Delaware, DE
# Florida, FL
# Georgia, GA
# Hawaii, HI
# Idaho, ID
# Illinois, IL
# Indiana, IN
# Iowa, IA
# Kansas, KS
# Kentucky, KY
# Louisiana, LA
# Maine, ME
# Maryland, MD
# Massachusetts, MA
# Michigan, MI
# Minnesota, MN
# Mississippi, MS
# Missouri, MO
# Montana, MT
# Nebraska, NE
# Nevada, NV
# New Hampshire, NH
# New Jersey, NJ
# New Mexico, NM
# New York, NY
# North Carolina, NC
# North Dakota, ND
# Ohio, OH
# Oklahoma, OK
# Oregon, OR
# Pennsylvania, PA
# Rhode Island, RI
# South Carolina, SC
# South Dakota, SD
# Tennessee, TN
# Texas, TX
# Utah, UT
# Vermont, VT
# Virginia, VA
# Washington, WA
# West Virginia, WV
# Wisconsin, WI
# Wyoming, WY
# District of Columbia, DC
# American Samoa, AS
# Guam, GU
# Northern Mariana Islands, MP
# Puerto Rico, PR
# U.S. Virgin Islands, VI

#===============================================================================================================
#                                               Solution
#===============================================================================================================

E={:"District of Columbia"=>:DC,:"Northern Mariana Islands"=>:MP,:"U.S. Virgin Islands"=>:VI,Alaska: :AK,Arizona: :AZ,Connecticut: :CT,Georgia: :GA,Hawaii: :HI,Iowa: :IA,Kansas: :KS,Kentucky: :KY,Louisiana: :LA,Maine: :ME,Maryland: :MD,Minnesota: :MN,Mississippi: :MS,Missouri: :MO, Montana: :MT,Nevada: :NV,Pennsylvania: :PA,Tennessee: :TN,Texas: :TX,Vermont: :VT,Virginia: :VA}
def abbr(s)
a=s.split
m=s.to_sym
E[m] ? E[m].to_s : a.size==1 ? s[0..1].upcase : a[0][0]+a[1][0]
end
