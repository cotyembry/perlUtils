
#gp - I called it to stand for git push (and I wanted it to be super short to type)

# if (not defined $argument1) {}
# if (defined $argument1) {}
$argument1 = $ARGV[0];				#$argument1 will be the commit message

# system "type search.pl"

if(defined $argument1) {
	system "git add -A";
	system "git commit -m \"$argument1\"";
	system "git push origin master";
}
else {
	system "git add -A";
	system "git commit -m \"updating files\"";
	system "git push origin master";
	# system "git add -A && git commit \"updating files\" && git push origin master";
}
