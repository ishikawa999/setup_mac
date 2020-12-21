
# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install ansible

# ansibleを実行
# ansible-playbook --syntax-check setup.yml -i inventory
ansible-playbook setup.yml -i inventory
