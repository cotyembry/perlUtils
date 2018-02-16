

system "npm run webpack";
system "move .\\dist\\bundle.js .\\surgeDeployment\\dist\\";
system "surge .\\surgeDeployment\\";



# # if (not defined $argument1) {}
# # if (defined $argument1) {}
# $argument1 = $ARGV[0];				#$argument1 will be the commit message\
# $numberOfArguments = scalar @ARGV;
# $commitMessage = "";
# for($i = 0; $i < $numberOfArguments; $i++) {
# 	if($i == 0) {
# 		$commitMessage = "$ARGV[$i]";
# 	}
# 	else {
# 		$commitMessage = "$commitMessage $ARGV[$i]";
# 	}
# }

# if(defined $argument1) {
# 	#if here, this means at least one work was passed in to be put as the commit message
# 	system "git add -A";
# 	system "git commit -m \"$commitMessage\"";
# 	system "git push origin master";
# }
# else {
# 	system "git add -A";
# 	system "git commit -m \"updating files\"";
# 	system "git push origin master";
# }
