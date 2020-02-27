yes | apt-get update
yes | apt-get install openssh-client git

REPO_NAME=$1
REPO_URI=git@github.com:cuebic/$REPO_NAME.git

if [ ! -d ~/.ssh ]; then
   mkdir -p ~/.ssh
fi;
echo $SSH_KEY | awk '{gsub(/\\n/,"\n")}1' > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add

mkdir pull-and-run-tmp
cd pull-and-run-tmp
ssh-keyscan github.com >> ~/.ssh/known_hosts

curl -s https://raw.githubusercontent.com/cuebic/pull-and-run/master/pull.sh | bash -s $REPO_NAME

cd $REPO_NAME
cd app

dotnet build -c Release
dotnet run -c Release