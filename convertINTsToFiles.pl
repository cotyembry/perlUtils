# #TODO: add splash bang

#Author:	John Coty Embry
#Date:		06-17-2017	

#this will take a raw export from Studio, and for the int files that are wrappend in the
#    <Routine ... >
#        ...
#    </Routine>
#XML tags, it converts them to .int files available for git to start using tracking on ^_^









#goal:
#		track .int/routines with git




#export int routines into XML


#git clone the .int/routines repo into a designated folder set aside for this task




#iterate through XML to separate only the .int files into typical files on the file system




#do github stuff here
#git add -A

#git commit -m "committing new tracking info for the ints and routines"

#git remote add origin masterCache https://github.com/HealthPic/masterCache

#git push origin masterCache




# if (not defined $argument1) {}
# if (defined $argument2) {}
# $argument1 = $ARGV[0];
# $argument2 = $ARGV[1];

$hardcodedFilename = "./HealthPicFY2017Perl.xml";		#use this if you want rather than command line arguments

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
	if($_ =~ m/(\<Routine[ ]+name.*\>)/gi) {
		$foundRoutine = 1;
		if($_ =~ m/(\"[a-zA-Z0-9\.]+\")/) { #this gets the first quote value
			$fileName = $1;

			$fileName =~ s/^"(.*)"$/$1/;
			# or (faster if you always have quotes):
			# $string = substr($string, 1, length($string)-2);
		}
	}


	if($_ =~ m/\<\/Routine\>/gi) {
		$lastLineInFile = 1;
	}



	if($foundRoutine == 1) {
		if($lastLineInFile == 0) {
			$fRHelper++;
			

			if($fRHelper == 1) {
				#create the file
				$fileNameToUse = "${fileName}.int";

				print $fileNameToUse;

				open(jceFH, '>>', $fileNameToUse) or open(jceFH, '>', $fileNameToUse) or die "Could not open file '$fileNameToUse' $!";
			}
			if($fRHelper >= 2) {
				#because I don't want to print the XML part of the data
				print jceFH $_
			}
		}
		if($lastLineInFile == 1) {
			$foundRoutine = 0;
			$lastLineInFile = 0;
			$fRHelper = 0;
			
			close jceFH;
		}





	}



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
