
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible

# ansibleを実行
# ansible-playbook --syntax-check setup.yml -i inventory
ansible-playbook setup.yml -i inventory