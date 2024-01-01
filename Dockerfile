FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get update -y
RUN yes | unminimize 
RUN apt-get update -y
RUN apt-get install -y openssh-server
RUN apt-get install -y xfce4 xfce4-goodies
RUN apt-get install -y tigervnc-standalone-server
RUN apt-get install -y less sudo telnet emacs software-properties-common curl wget postgresql-client command-not-found tzdata
RUN add-apt-repository ppa:deadsnakes/ppa -y && apt update -y
RUN apt-get install -y python3.12-full
RUN curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/chrome.list
RUN apt-get update -y
RUN apt-get install -y google-chrome-stable
RUN update-alternatives --set x-session-manager /usr/bin/xfce4-session
RUN update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper
ENV TZ=America/New_York
RUN mkdir /etc/secrets && chmod 700 /etc/secrets
RUN mkdir /run/sshd && chmod 0755 /run/sshd # todo move this next to openssh install
EXPOSE 5901
EXPOSE 22


