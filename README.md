# vagrant-examples

Collection of vagrant examples. Mostly for different types of provisioning and for quick start new projects.

## Usage

Install vagrant-env plugin.
```shell
vagrant plugin install vagrant-env
```

Basic .env file shoul looks like below:
```
USER = "my_user"
GH = "my_github_user"

SSH_PUB_KEYS = "ssh-rsa xxxxxxx id_for_key"

VM_BOX = "bento/ubuntu-20.04"
VM_NAME = "myvmhostname"
```

USER - user name which would be created during provisioning  
GH - your github username to import public keys  
SSH_PUB_KEYS - additional keys. Use '\n' separator for multiple keys  
VM_BOX - box name to initialize virtual machine  
VM_NAME - will be used in virtual box vm name and as a hostname  
