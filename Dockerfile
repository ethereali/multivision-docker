FROM yamamuteki/ubuntu-lucid-i386

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i -e "s/archive.ubuntu.com/old-releases.ubuntu.com/g" /etc/apt/sources.list && \
    apt-get update && apt-get -yy dist-upgrade && apt-get -y --no-install-recommends install apt-utils && \
    apt-get -y --no-install-recommends install psmisc sudo libopenal1 libsdl1.2debian libavcodec52 libavformat52 \
    libswscale0 libqt4-xml libqt4-opengl libqt4-webkit libqt4-script libqt4-scripttools libvdpau1 libhighgui4 \
    x11-utils libglu1-mesa && rm -rf /var/lib/apt/lists/* && \
    export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown 1000:1000 -R /home/developer && \
    usermod -aG audio developer

COPY multivision2_2.0.0b57_i386_10.04-fixed.deb userconfig.tar.gz /home/developer/

RUN dpkg -i /home/developer/multivision2_2.0.0b57_i386_10.04-fixed.deb

USER developer

RUN cd /home/developer && tar -zxf userconfig.tar.gz

ENV HOME /home/developer

CMD ["/bin/bash"]
