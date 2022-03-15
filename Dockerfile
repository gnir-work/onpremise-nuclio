from ubuntu:22.04
# Python2.7
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt install build-essential checkinstall -y
RUN apt install libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev wget -y
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
RUN tar xzf Python-2.7.18.tgz
WORKDIR /tmp/Python-2.7.18
RUN ./configure --enable-optimizations
RUN make altinstall
WORKDIR /tmp
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python2.7 get-pip.py

# Python3.7
RUN apt-get install libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.8.9/Python-3.8.9.tgz
RUN tar xzf Python-3.8.9.tgz
WORKDIR /tmp/Python-3.8.9
RUN ./configure --enable-optimizations
RUN make altinstall
WORKDIR /tmp
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.8 get-pip.py.1
RUN cp /usr/local/bin/python3.8 /usr/local/bin/python

# Random
RUN echo "this is a test" > /tmp/a
RUN echo "print 'I am python2.7'" > /tmp/test.py
