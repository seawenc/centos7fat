# docker build
FROM centos:7
MAINTAINER chengsheng(seawenc)

WORKDIR /opt/app
RUN rm -rf /etc/yum.repos.d/* && \
    curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.163.com/.help/CentOS7-Base-163.repo && \
    yum install vim which telnet tar nmap iproute perl wget net-tools bind-utils openssh-clients unzip traceroute lzop -y && \
    yum -y install kde-l10n-Chinese reinstall glibc-common && \
    yum clean all

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz" && \
   tar -xzf jdk-8u141-linux-x64.tar.gz && \
   rm -rf jdk1.8.0_141/*.zip jdk-8u141-linux-x64.tar.gz

ENV JAVA_HOME=/opt/app/jdk1.8.0_141
ENV PATH $JAVA_HOME/bin:$PATH
#配置中文支持
RUN localedef -c -f UTF-8 -i en_US en_US.utf8
ENV LC_ALL "en_US.UTF-8"
#修改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#RUN rm -rf /etc/yum.repos.d/* && \
#    curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
