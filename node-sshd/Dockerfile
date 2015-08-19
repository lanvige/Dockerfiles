FROM node:latest
# for more info about this basic image:
# https://github.com/lanvige/node-sshd

MAINTAINER Lanvige Jiang, lanvige@gmail.com, http://blog.lanvige.com

# Replace source to 163 for #thegreatwall
RUN echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" > /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN echo 'root:password01!' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]