FROM ubuntu:14.04
MAINTAINER calos <359000081@qq.com>
RUN echo "Asia/Shanghai">/etc/one;dpkg-reconfigure -f noninteractive tzdata
RUN apt-get update && apt-install -y curl vim net-tools && \ rm -rf /var/lib/apt/lists/* && mkdir -p /app
RUN  curl -L 'http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz \
    && curl -L 'http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.8/bin/apache-tomcat-7.0.8.tar.gz' | tar -xz
WORKDIR /app
COPY tomcat7.sh /app/tomcat7.sh
RUN chmod+x /app/tomcat7.sh
EXPOSE 8080

ENTRYPOINT ["/app/tomcat7.sh"]