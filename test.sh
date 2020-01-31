yes | apt-get update
yes | apt-get install openssh-client git

REPO_URI=$1
REPO_NAME=$(echo $REPO_URI | rev | cut -d "/" -f 1 | rev | cut -d "." -f 1)
if [ ! -d ~/.ssh ]; then
   mkdir -p ~/.ssh
fi;
echo $SSH_KEY | awk '{gsub(/\\n/,"\n")}1' > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add

mkdir pull-and-run-tmp
cd pull-and-run-tmp
yes | git clone $REPO_URI $REPO_NAME
