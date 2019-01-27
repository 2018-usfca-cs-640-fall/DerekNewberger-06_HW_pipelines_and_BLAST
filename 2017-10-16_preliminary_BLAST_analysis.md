# This is a markdown file that contains a section summarizing 
# the QC checks I ran with FastQC as well as some preliminary
# research into the organisms I found using BLAST. The
# complementary script used bash. 

# Derek Newberger
# Drnewberger@usfca.edu
# October 16th, 2018

# This section discusses the QC checks ran with FastQC. It 
# will talk about how the sequences looked and if they were
# deemed to be sufficient quality.Using Cyberduck and looking at the
# FastQC files, I would say that most of them look fine. I looked at
# the first three file qualifiers, basic statistics, per base sequence
# quality, and per sequence quality scores. Using my analytical graph
# reading abilities and the FastQC Report examples of what is "good" 
# data versus "bad" data as a template made a few observations. First,
# for the basic statistics, I had initially thought that the "no sequence
# flagged as poor quality" was important. After reviewing the files I can
# guess two things; either the trimming performed was set with appropriate
# parameters as to avoid this or the data is beautilful, since there was 
# never any sequences flagged. The lenght of nearly all the sequences were
# between 160 and 255 base pairs. I realize that we had set a minimum 
# lenght of base pairs at 150, but it is a curious thing as to why they 
# seemed to have had a maximum. Looking up bacterium genes and base pairs,
# this still seems short since a possible average for each gene is around 
# 900 base pairs (Jones and Bartlett Publishers, 2007). All these sequences
# were perfomed by Sanger/Illumina (1.9) which is important to note the %GC
# since it is in those areas that mistakes or quality is a challenge. Most 
# of the sequences had a 50% GC, and with only two other nucleotides this
# does not seem immediately alarming. For per base sequence quality, there
# appeared to be some issues. Err1942280, 82, 83, and 84 had flagged or noted
# by an exclamation mark to make one aware of its faults. Most of the time
# they did not appear that much worse than those files that were not
# flagged. Both ERR1942293 and ERR1942299 were marked with a red X and the
# quality for those did look poor as the blue line was not stright, the box
# plots were large, and the graph dipped into the red with ocillations. Lastly,
# the per sequence quality scores all looked the same and all files had
# passed. In all, the data looked acceptable and the trimming helped. 
#
# This section is about the organisms that was found using BLAST and some 
# preliminary research. While viewing the .CSV files, there were some files that repeatedly listed a particular organisms while others seemed
# to be incredibly diverse. Within the "diverse" files, there seemed to be
# larger bacteria communities which resided on the human beings. The article
# speaks of how diverse these communities are and that they can literally
# be more unique than fingerprints or distinguish between genetically
# identicle twins. From this, I was very surprised to see that some files 
# showed a lot less diversity and multiple repeating organism names. It
# would seem that at times these bacterial communities were dominated by
# a specific organism. Below is a list of which files showed a higher
# diversity or the listed organism's names that was repeated several times.
# ERR19422__:      
# 81, 83, 84, 89, 90, 94, 96, and 98: Diverse
# 80 and 87: Bacteroidetes endosymbiont of Metaseiulus occidentalis
# 82: Spiroplasma corruscae
# 85, 87, and 92: Bartonella washoeensis 
# 86, 91, 95, and 97: Solemya pervernicosa gill symbiont
# 93: Acinetobacter haemolyticus
# 99: Aquitalea
#
# I will dicuss a few of these organisms based on what a light search
# brought up and how curious it is to find a community of those on a 
# human being. For 80 and 87, the bacteroidetes are endosymbionts of an
# effective predatory mite (Hoy, 2009). Who ever this person is, they must play in
# the dirt or at least have a career that involves being outside in order
# to have the guts of a mite land on them. This next one from 82 comes from
# the gut of a lampyrid beetle and is absolutely resistent to penicillin,
# (Hackett, 1996) which is a scary thought if it ever decided to become a
# pathogen against humans, since it has also shown to be able to live on us.      
# Solemya pervernicosa is a mollusk (Kuroda, 1948), and I can guess like how future 
# detectives will use this imformation (possibly) that this person probably
# interacts and lives by the ocean. Bartonella washoensis can infect
# squirrels but as a pathogen can cause meningitis in human beings 
# (Kosoy, 2003). Acinetobacter haemolyticus is possibly another pathogen 
# (Grotiuz, 2002). I briefly looked at other organisms and surprisingly 
# enough there are several pathogens living on the finger tips or pits of
# these individuals being tested, which then can live on keyboards, probably
# for more than two weeks. Makes me want to wash my hands after doing this 
# project which thankfully I did not do on a public computer. 
#
# Links to works cited
# http://bioscience.jbpub.com/cells/MBIO137.aspx    
# https://www.ncbi.nlm.nih.gov/pubmed/19334003
# https://www.ncbi.nlm.nih.gov/pubmed/8863421
# http://www.marinespecies.org/aphia.php?p=taxdetails&id=507133
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC149662/
# https://jcm.asm.org/content/44/10/3838.long
