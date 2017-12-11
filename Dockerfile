FROM ubuntu
MAINTAINER Nathan Feldsien <nfeld9807@gmail.com>

# Install packages
RUN apt-get update -y && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common

# NeoVim
RUN add-apt-repository ppa:neovim-ppa/stable

RUN apt-get update -y

RUN apt-get install -y --fix-missing \
    software-properties-common \
    build-essential \
    git \
    neovim \
    zsh \
    curl \
    tree \
    ack-grep \
    npm

# Node
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs

# Create Empty SSH Profile to pass build
RUN mkdir /root/.ssh
RUN touch /root/.ssh/id_rsa

# Home
ADD home /root/

# Oh-My-ZSH
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh
RUN cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc
RUN chsh -s /bin/zsh

# NeoVim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Change Permissions for default keys
RUN chmod 600 /root/.ssh/id_rsa*

VOLUME ["/data", "/projects"]

WORKDIR /root

CMD /bin/zsh
