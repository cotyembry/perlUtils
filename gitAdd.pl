# #TODO: add splash bang

#Author:	John Coty Embry
#Date:		06-21-2017	



# This gitAdd.pl script needs to be in a folder relative to a file named gitAdd.txt which contains for each line the files to be added
# An example of the file contents would be the following:
# MARSINSER.CSP
# MARSMEDCA2.CSP
# MARSMEDCAMNU.csp
# MARSNRSADM.csp
# MARSNRSADM1.CSP
# MARSOKCPPD.csp
# MARSOPPDCHRT.csp
# MARSOUTPTPRV.CSP
# MARSOUTPTPRV1.csp
# MARSOUTPTPRV3.CSP
# MARSPCCCHRT.csp
# MARSPCCCHRT2.csp
# MARSPCCDFNPRV.csp
# MARSPCCEXP.CSP
# MARSPCCMAIN.CSP


# so make sure you have that requirement going then it will do a `git add fileName` for each of the files given




# if (not defined $argument1) {}
# if (defined $argument2) {}
# $argument1 = $ARGV[0];
# $argument2 = $ARGV[1];

$hardcodedFilename = "./gitAdd.txt";		#use this if you want rather than command line arguments

					#1.  #2.    #3.  #4.    #5.#6.			#these are each a different "or" part of the regex to support linux and windows directory paths
if($argument1 =~ m/^[\.\/|\.\.\/|\.\\|\.\.\\|\\|\/]/gi) {
	#I will trust the path was typed correctly
	open FH, "$argument1" or die "Cannot open: $argument1\n";
}
elsif(defined $argument1) {
	#if here I will assume the file path specified is relative to the script's execution location
	open FH, "./$argument1" or die "Cannot open: $argument1\n";
}
else {
	#otherwise open the hardcoded filename above
	open FH, "$hardcodedFilename" or die "Cannot open: $!\n";
}
 # <Routine name="MARSLREXPT" type="INT" languagemode="0" timestamp="63952,75839.904905">


$foundRoutine = 0;
$lastLineInFile = 0;
$fRHelper = 0;

$fileName = '';

while(<FH>) {
	chomp($_);
	# print"git add $_";
	system"git add $_";
}




close FH;
