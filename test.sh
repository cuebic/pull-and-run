REPO_URI=$1
echo $REPO_URI
REPO_NAME=$(echo $REPO_URI | rev | cut -d "/" -f 1 | rev | cut -d "." -f 1)
if [!-d ~/.ssh]; then
   mkdir -p ~/.ssh
fi;
echo $SSH_KEY > ~/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add

mkdir pull-and-run-tmp
cd pull-and-run-tmp
git clone $REPO_URI $REPO_NAME
