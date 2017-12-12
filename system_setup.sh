#!/bin/bash

apt update
apt -y install curl sudo git build-essential elinks vim unattended-upgrades \
    nload net-tools

adduser jmay sudo

update-alternatives --set editor /usr/bin/vim.basic

sed -e "s/^#force_color_prompt/force_color_prompt/g" ~jmay/.bashrc -i
sed -e "s/^#alias ll=/alias ll=/g" ~jmay/.bashrc -i
echo "set number" >> ~jmay/.vimrc
echo "set tabstop=4" >> ~jmay/.vimrc
echo "set shiftwidth=4" >> ~jmay/.vimrc
echo "set softtabstop=0 expandtab smarttab" >> ~jmay/.vimrc
chown jmay:jmay ~jmay/.vimrc

install -o jmay -g jmay -m 700 -d ~jmay/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTjrdEDDp+XOeoamETALGsXXP9FWYNgmMtiOFo16fkW7D+o3oqKJyhIQVHCwNsl8IuBBtgiP4IbZdOXiYBZlo4zSOdd+UGrju378v4Gs6SJ38QRNa867MnQH6j8jd3YaI+8uAQ8Gmv9txnp68bfHKxXkDb1PCPDpTzE1rfXK2aKUZYOI1+xjjR2pz7mg6d8ZSFXcc872/l/u7fMQEuBiJ+sCxje/i7AEUx4Ladegi7LEQ17subMkSjVXUt5ScHwTQVQSl3Wx5XMZFhmbuG2XXK53qT4AsMb1vJSMb8/pLKsg1wDHAJzxRExiLHI5MUtHppv3LYzGC1g48Bb0F/Bkg1MUemVJ3OmxHskGorE0rq2evO3DTS2ngZHc/tnlxMfC23EUUXnUbxIAxFYMvemmBAsOTKdt4ExmVprm74p8jhY10JSOd4+UwWmkby6Kd4IXI4r3tk3vd5ugyNzylzA1WurkP33zF9hO265UXo9xdBogoLpcV57ZEup+Esu4kR5TkaeKLi4lyWmlIiD27fcJxmF7VoE/EwRDP/70UUq/H8QsBjoI4ghN387zQ5c6PITJ/AECM9vYEHvZ9IOirk0g3wKq5ZyGEYTnK7In/jzfy4ZXTXWEhptAEesI94EavIxuVJIAoro4WCnBsoi4Kq3Jz7NL6V1ASgi2JmWj2cQtStZQ== jmay@sam" \
    >> ~jmay/.ssh/authorized_keys
chown jmay:jmay ~jmay/.ssh/authorized_keys
chmod 600 ~jmay/.ssh/authorized_keys

sed -i '9iDefaults\tinsults' /etc/sudoers

vim /etc/apt/apt.conf.d/50unattended-upgrades