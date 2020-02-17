# multivision-docker
Dockerfile for multivision

build with command
docker build multivision-docker -t multivision

run with command
docker run -it --net host --device /dev/snd:/dev/snd -e DISPLAY=$DISPLAY -e TZ=Asia/Yekaterinburg -v /tmp/.X11-unix:/tmp/.X11-unix ethereali/multivision bash -c "cd /opt/multivision2 && ./multivision &>/dev/null"
