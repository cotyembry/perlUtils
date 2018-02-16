#TODO: add splash bang

#Author:	John Coty Embry
#Date:		04-27-2017	

# if (not defined $argument1) {}
# if (defined $argument2) {}
$argument1 = $ARGV[0];
$argument2 = $ARGV[1];

$hardcodedFilename = "./HealthPicExport.xml";		#use this if you want rather than command line arguments

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

$lineNumber = 0;
$currentFile = "";
$printedOnce = 0;
$foundMethodCall = 0;
$foundClosingCall = 0;
$foundCaption = 0;
$printedM = 0;

while(<FH>) {
	$lineNumber++;
	# get the file name currently being worked on before starting anything else
	if($_ =~ m/(\<CSP[ ]+name.*\>)/g) {
		$currentFile = $1; #the $1 will recognize the first match within the () 
		$currentFile =~ s/ //g; #this removes spaces for more consistent comparing
		$currentFile =~ m/(\"[a-zA-Z0-9\.]+\")/g; #this gets the first quote value
		$currentFile = $1;
		$length = length $currentFile;
		$length = $length - 2;
		$currentFile = substr $currentFile, 1, $length; #this strips away the quotes


		$foundMethodCall = 0;
		$foundClosingCall = 0;
		$foundCaption = 0;
		$printedM = 0;
	}
	if($_ =~ m/\$\(.*\)\.fixheadertable\(\{/g) {
		$foundMethodCall = 1;
	}
	if($foundMethodCall == 1 && $_ =~ m/.*\}\).*/g) { 
		$foundClosingCall = 1;
	}


	if($foundMethodCall == 1 && $_ =~ m/caption.*\:/gi) {
		$foundCaption = 1;
		if($printedOnce == 0) {
			$printedOnce = 1;
			print "Found in the following file(s):\n";
		}
		print "\t$currentFile, line: $lineNumber\n";
	}

	if($foundClosingCall == 1 && $foundCaption == 0) {
		if($printedM == 0) {
			print "DID NOT FIND CAPTION IN: \t$currentFile, line: $lineNumber\n";
			$printedM = 1;
		}
	}
}

close FH;