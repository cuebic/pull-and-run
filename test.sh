REPO_URI=$1
echo $REPO_URI
REPO_NAME=$(echo $REPO_URI | rev | cut -d "/" -f 1 | rev | cut -d "." -f 1)
echo $REPO_NAME
echo "ssh_key" > ~/.ssh/id_rsa
eval `ssh-agent -s`
ssh-add

mkdir pull-and-run-tmp
cd pull-and-run-tmp
git clone $REPO_URI $REPO_NAME
