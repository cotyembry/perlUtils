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





# # if (not defined $argument1) {}
# # if (defined $argument2) {}
# $argument1 = $ARGV[0];
# $argument2 = $ARGV[1];

# # $hardcodedFilename = "./HealthPicFY2017_3170426.xml";		#use this if you want rather than command line arguments
# $hardcodedFilename = "../HealthPicFY2017_3170602Backup.xml";		#use this if you want rather than command line arguments

# 					#1.  #2.    #3.  #4.    #5.#6.			#these are each a different "or" part of the regex to support linux and windows directory paths
# if($argument1 =~ m/^[\.\/|\.\.\/|\.\\|\.\.\\|\\|\/]/gi) {
# 	#I will trust the path was typed correctly
# 	open FH, "$argument1" or die "Cannot open: $argument1\n";
# }
# elsif(defined $argument1) {
# 	#if here I will assume the file path specified is relative to the script's execution location
# 	open FH, "./$argument1" or die "Cannot open: $argument1\n";
# }
# else {
# 	#otherwise open the hardcoded filename above
# 	open FH, "$hardcodedFilename" or die "Cannot open: $!\n";
# }

# $lineNumber = 0;
# $currentFile = "";
# $printedOnce = 0;

# while(<FH>) {
# 	$lineNumber++;
# 	# get the file name currently being worked on before starting anything else
# 	if($_ =~ m/(\<CSP[ ]+name.*\>)/g) {
# 		$currentFile = $1; #the $1 will recognize the first match within the () 
# 		$currentFile =~ s/ //g; #this removes spaces for more consistent comparing
# 		$currentFile =~ m/(\"[a-zA-Z0-9\.]+\")/g; #this gets the first quote value
# 		$currentFile = $1;
# 		$length = length $currentFile;
# 		$length = $length - 2;
# 		$currentFile = substr $currentFile, 1, $length; #this strips away the quotes
	
# 		# if($currentFile == 1) {
# 		# 	print ">$2< true"
# 		# }
# 		# else {
# 		# 	print $currentFile
# 		# }
# 	}



# 	# if($_ =~ m/\<\/[ ]*body[ ]*\>/gi && $currentFile != 1) {	#if $currentFile == 1 then its looping currently in the context of a routine and not a .csp page
# 	if($_ =~ m/\<\/[ ]*head[ ]*\>/gi && $currentFile != 1) {	#if $currentFile == 1 then its looping currently in the context of a routine and not a .csp page
# 		#dont print the line yet, I'll do it later down in the script
# 		$endHeadTagFound = 1;
# 	}
# 	# elsif($_ =~ m/\$\([ ]*document[ ]*\)\.ready\([ ]*function[ ]*\(.*\)[ ]*\{/gi && $currentFile != 1) {
# 	# 	$documentReadyFound = 1;
# 	# }
# 	else {
# 		print $_; #this line prints out the contents of the file(s)
# 	}


# 	if($endHeadTagFound == 1) {
# 		#above I do this regex check
# 		$endHeadTagFound = 0;
# 		print"\n\n";
# 		print"\t<script language=\"javascript\" type=\"text/javascript\" src=\"marsjs/js/javascriptOnAllPages.js\"></script>\n\n";
# 		print"\t<CSP:INCLUDE PAGE=\"MARSONALLPAGES.csp\">\n";
		
# 		print $_;

# 		# if($documentReadyFound == 0) {
# 		# 	print $_;	#otherwise the line will be printed in the else if(...) below
# 		# }
# 	}


# }

# close FH;
