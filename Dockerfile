# Base docker development image
# Author: Nirmit Patel
# Created: 01/09/2017
# Updated: 06/30/2018
# Base: ubunut 16.04 xenial

FROM ubuntu:16.04

# Environment
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US en_US.UTF-8

# Create directories
RUN mkdir /scripts /code

# Copy and Run bootstrap scripts
COPY ./scripts/install_baseline.sh /scripts/install_baseline.sh
RUN /bin/bash /scripts/install_baseline.sh

COPY ./scripts/install_ppas.sh /scripts/install_ppas.sh
RUN /bin/bash /scripts/install_ppas.sh

COPY ./scripts/install_fish.sh /scripts/install_fish.sh
RUN /bin/bash /scripts/install_fish.sh

COPY ./scripts/install_development_tools.sh /scripts/install_development_tools.sh
RUN /bin/bash /scripts/install_development_tools.sh

CMD /usr/bin/fish
