FROM ubuntu
MAINTAINER Nathan Feldsien <nfeld9807@gmail.com>

# Install packages
RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y \
    git \
    vim \
    zsh \
    curl

# Oh-My-ZSH
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
COPY zshrc /root/.zshrc
RUN chsh -s /bin/zsh

# SSH
RUN mkdir ~/.ssh
COPY ssh/ /root/.ssh
RUN chmod 700 /root/.ssh

VOLUME ["/data"]

WORKDIR /data
COPY data/ /data

CMD /bin/zsh
