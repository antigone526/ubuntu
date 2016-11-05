FROM ubuntu
MAINTAINER Nathan Feldsien <n.feldsien@me.com>

# Install packages
RUN apt-get update -y && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common

# NeoVim Repository
RUN  add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update -y

RUN apt-get install -y \
    build-essential \
    git \
    neovim \
    vim \
    zsh \
    curl \
    tree \
    ack-grep \
    tmux \
    python-dev \
    python3-dev \
    python-pip \
    python3-pip \
    cmake \
    automake \
    gcc \
    npm

# Node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
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
