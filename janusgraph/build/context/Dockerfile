FROM maven:3.8-eclipse-temurin-11

ARG USER_UID
ARG USER_GID

COPY root/ /

RUN set -x; getent group ${USER_GID} || groupadd -g ${USER_GID} janusgraph
RUN set -x; getent passwd ${USER_UID} ||  useradd janusgraph -u ${USER_UID}  -g ${USER_GID} -m -s /bin/bash
RUN set -x; usermod  -m -d /janusgraph  $(getent passwd ${USER_UID} | cut -d':' -f1)

WORKDIR /janusgraph
ENV MAVEN_CONFIG=''
ENTRYPOINT ["/usr/local/bin/janusgraph-entrypoint.sh"]
