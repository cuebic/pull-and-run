REPO_NAME=$1
REPO_URI=git@github.com:cuebic/$1.git


git clone $REPO_URI $REPO_NAME

for projectFile in ./$REPO_NAME/app/*.csproj
do
	projectNames=$(perl -nle 'print $1 while /<ProjectReference Include="..\\..\\(.+)\\app\\.+.csproj" \/>/g' $projectFile)
	for projectName in $projectNames; do
		curl -s https://raw.githubusercontent.com/cuebic/pull-and-run/master/pull.sh | bash -s $projectName
	done
done

