FROM ubuntu:16.04
RUN apt-get update && apt-get install -yq python3 python3-pip 
RUN pip3 install django==1.7
RUN pip3 install --upgrade selenium
RUN apt-get update && apt-get install -yq vim git sudo tmux 
RUN apt-get update && apt-get install -yq firefox
RUN apt-get update && apt-get install -yq wget

# RUN apt-get install libxss1 libappindicator1 libindicator7
# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# RUN dpkg -i google-chrome*.deb
# RUN apt-get install -f

# RUN apt-get install unzip
# RUN 
# RUN wget -N http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip
# RUN unzip chromedriver_linux64.zip
# RUN chmod +x chromedriver

# RUN mv -f chromedriver /usr/local/share/chromedriver
# RUN ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
# RUN ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
WORKDIR /home/developer
ENV HOME /home/developer
