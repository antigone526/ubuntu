FROM ubuntu
MAINTAINER Nathan Feldsien <nfeld9807@gmail.com>

# Install packages
RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y \
    build-essential \
    git \
    vim \
    zsh \
    curl \
    tree \
    ack-grep \
    tmux \
    python-dev \
    python3-dev \
    cmake \
    automake \
    gcc \
    npm

# Node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs

# Oh-My-ZSH
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /root/.oh-my-zsh
RUN cp /root/.oh-my-zsh/templates/zshrc.zsh-template /root/.zshrc
# Copy User zshrc config file over if it exists
COPY zshrc /root/.zshrc
RUN chsh -s /bin/zsh

# Vim
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Add vimrc template with vim plug plugin manager installed
COPY vimrc-template /root/.vimrc
# Overwrite default with user vimrc
COPY vimrc /root/.vimrc

# SSH
RUN mkdir /root/.ssh
COPY ssh/ /root/.ssh
RUN chmod 700 /root/.ssh

VOLUME ["/data", "/projects"]

WORKDIR /root

CMD /bin/zsh
