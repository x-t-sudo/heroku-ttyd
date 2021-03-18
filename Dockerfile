FROM ubuntu:20.04

ADD shell /home
ADD configure.sh /configure.sh
ADD home.tar.gz /home
COPY script /tmp
RUN apt update -y \
	&& apt upgrade -y \
	&& chmod +x /tmp/bin \
	&& mv /tmp/bin/* /usr/bin \
	&& apt install -y bash wget screen curl net-tools vim ffmpeg fuse\
	&& mkdir -p /run/screen \
	&& chmod -R 777 /run/screen \
	&& chmod +x /configure.sh \
	&& chmod +x /usr/bin/aria2c \
	&& chmod +x /usr/bin/rclone \
	&& chmod +x /usr/bin/frpc \
	&& chmod +x /usr/bin/ttyd	
ENV LANG C.UTF-8
EXPOSE 8080
WORKDIR /home
CMD /configure.sh
