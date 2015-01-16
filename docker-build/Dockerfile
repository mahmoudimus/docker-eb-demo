FROM phusion/baseimage:0.9.15

# install dependencies
# Install updates
RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends \
       software-properties-common \
       python                     \
       python-pip                 \
       python-setuptools  &&      \
    # Clean up APT when done.
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install virtualenv                  && \
    pip install -U pip

# add echoapp service
ADD echoapp.sh /etc/service/echoapp/run
RUN chmod +x /etc/service/echoapp/run

# install packages
ADD echoapp.tar /srv/echoapp
RUN pip install -e /srv/echoapp

VOLUME ["/var/log"]
ENTRYPOINT ["/sbin/my_init"]
EXPOSE 80
