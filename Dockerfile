FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y
RUN yes | unminimize 
RUN apt-get install -y xfce4
RUN apt-get install -y xfce4-goodies
RUN apt-get install -y tigervnc-standalone-server
RUN apt-get install -y less
RUN apt-get install -y sudo
RUN apt-get install -y telnet
RUN apt-get install -y emacs
RUN apt-get install -y software-properties-common
RUN sudo add-apt-repository ppa:deadsnakes/ppa -y && apt update -y
RUN apt install -y python3.11-full
RUN apt-get install -y curl wget
RUN curl https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/chrome.list
RUN apt-get update -y
RUN apt-get install -y google-chrome-stable
RUN update-alternatives --set x-session-manager /usr/bin/xfce4-session
RUN update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper
ENV TZ=America/New_York
RUN apt-get install tzdata
RUN mkdir /etc/secrets && chmod 700 /etc/secrets
EXPOSE 5901


