FROM ubuntu:24.04

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y wget xz-utils libgtk-3-0 mpg123 apulse libpulse0 libcanberra-dev libcanberra-gtk3-0 packagekit-gtk3-module

RUN wget -q -O firefox-latest.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=pt-BR"
RUN tar xJf firefox-latest.tar.bz2
RUN mv firefox /opt/
RUN ln -s /opt/firefox/firefox /usr/local/bin/firefox


# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    # echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    # chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# USER developer
# ENV HOME /home/developer
# CMD /usr/bin/firefox
CMD /usr/local/bin/firefox