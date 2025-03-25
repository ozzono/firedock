FROM ubuntu:24.04

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y nala
RUN nala install -y curl file wget xz-utils libgtk-3-0 mpg123 apulse libpulse0 libcanberra-dev libcanberra-gtk3-0 packagekit-gtk3-module

RUN wget -q -O firefox-latest.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=pt-BR"
RUN tar xJf firefox-latest.tar.bz2
RUN mv firefox /opt/
RUN ln -s /opt/firefox/firefox /usr/local/bin/firefox

RUN mkdir /root/pwd
RUN wget -q -P /root/temp https://github.com/aclap-dev/vdhcoapp/releases/download/v2.0.19/vdhcoapp-linux-x86_64.deb
RUN apt install -y /root/temp/vdhcoapp-linux-x86_64.deb

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

CMD /usr/local/bin/firefox