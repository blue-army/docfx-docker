FROM mono:6.12.0.182
LABEL maintainer="lucas-natraj" 

ENV DOCFX_VER 2.59.3

RUN apt-get update && \
    apt-get install unzip wget nano apt-transport-https -y
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb
RUN apt-get update && \
    apt-get install -y dotnet-sdk-6.0
RUN wget -q -P /tmp https://github.com/dotnet/docfx/releases/download/v${DOCFX_VER}/docfx.zip && \
    mkdir -p /opt/docfx && \
    unzip /tmp/docfx.zip -d /opt/docfx && \
    echo '#!/bin/bash\nmono /opt/docfx/docfx.exe $@' > /usr/bin/docfx && \
    chmod +x /usr/bin/docfx

ENTRYPOINT [ "docfx" ]
CMD [ "help" ]
