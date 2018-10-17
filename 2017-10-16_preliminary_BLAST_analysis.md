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
# passed.
#
#  

    

# Links to works cited
# http://bioscience.jbpub.com/cells/MBIO137.aspx    
