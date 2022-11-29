# TODO: do I really need this bloated image?
FROM ubuntu:latest

# TODO: build guile pretending to be kiss.
# RUN apt-get update --quiet=2 \
# && apt-get install -y guile-3.0

# Set the root directory of kiss.
ENV KISS_ROOT /home/developer/kiss

# Add a new non-root user called developer and set it as the current user
# (this will create a /home/developer directory).
RUN useradd --create-home --shell /bin/bash developer
USER developer

# Configure the main working directory. This is the base directory used in any
# further RUN, COPY, and ENTRYPOINT commands.
ENV HOME /home/developer
WORKDIR $HOME

# Create the root directory for kiss and copy the source code to it.
COPY --chown=developer:developer . $KISS_ROOT

# Configure the final main working directory.
WORKDIR $KISS_ROOT
