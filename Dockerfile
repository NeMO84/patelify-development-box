# Base docker development image
# Author: Nirmit Patel
# Date: 01/09/2017
# Base: ubunut 16.04 xenial 

FROM ubuntu:16.04

# Environment
RUN locale-gen en_US en_US.UTF-8

# Create directories
RUN mkdir /scripts /code

# Copy over scripts
COPY ./scripts /scripts

# Run bootstapping commands
RUN /bin/bash /scripts/install_baseline.sh
RUN /bin/bash /scripts/install_ppas.sh
RUN /bin/bash /scripts/install_fish.sh
RUN /bin/bash /scripts/install_development_tools.sh

CMD /usr/bin/fish
