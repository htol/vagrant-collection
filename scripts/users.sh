useradd -d /home/$USERNAME -s /bin/bash -m $USERNAME --groups sudo
echo "%$USERNAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USERNAME
mkdir -p /home/$USERNAME/.ssh
chown -R $USERNAME:$USERNAME /home/$USERNAME
su $USERNAME -c 'echo "$SSH_PUB_KEYS" >> /home/$USERNAME/.ssh/authorized_keys'
su $USERNAME -c 'ssh-import-id-gh $GH'
mkdir /root/.ssh
cat /home/$USERNAME/.ssh/authorized_keys >> /root/.ssh/authorized_keys
chmod -R 700 /root/.ssh
cat /home/$USERNAME/.ssh/authorized_keys >> /home/vagrant/.ssh/authorized_keys
# sed -i "s@http:\/\/ar/http:\/\@ru.ar@g" /etc/apt/sources.list
