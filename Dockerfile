FROM archlinux:latest

RUN mkdir -p /scripts

COPY entrypoint.sh /scripts
COPY setup-dependencies.sh /scripts
COPY setup-jdk.sh /scripts
COPY setup-commandbox.sh /scripts
COPY start-server.sh /scripts
COPY install-app.sh /scripts

WORKDIR /scripts

RUN chmod +x entrypoint.sh
RUN chmod +x setup-jdk.sh
RUN chmod +x setup-commandbox.sh
RUN chmod +x start-server.sh
RUN chmod +x install-app.sh
RUN chmod +x setup-dependencies.sh

# BIN_DIR = Where the box binary goes
ENV BIN_DIR /usr/local/bin
# LIB_DIR = Where the build files go
ENV LIB_DIR /usr/local/lib
# COMMANDBOX_HOME = Where CommmandBox Lives
ENV COMMANDBOX_HOME=$LIB_DIR/CommandBox
# Commandbox version
ENV COMMANDBOX_VERSION=5.6.1

# RUN ./setup-dependencies.sh
RUN ./setup-jdk.sh
RUN ./setup-commandbox.sh
RUN ./install-app.sh

CMD ["./start-server.sh"]