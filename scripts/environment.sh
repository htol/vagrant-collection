sudo su -l $USERNAME -c " \
    git clone https://github.com/TheLocehiliosan/yadm.git ~/.local/yadm-project && \
    mkdir -p ~/.local/bin && \
    ln -s ~/.local/yadm-project/yadm ~/.local/bin/yadm && \
    ~/.local/bin/yadm clone --no-bootstrap https://github.com/htol/dotfiles.git"
