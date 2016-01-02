FROM moyan/ubuntu

#COPY sources.list /etc/apt/sources.list
COPY pip.conf /home/root/.pip/pip.conf
COPY get-pip.py /home/root/
COPY freetype-2.4.10.tar.gz /tmp/

RUN apt-get update && \
    apt-get -y install python && \
    apt-get -y install curl python-dev gcc pandoc
RUN apt-get -y install libpng-dev cmake qt-sdk
RUN cd /tmp && \
    tar zxvf freetype-2.4.10.tar.gz && cd freetype-*/ && ./configure && make && make install && \
    mkdir -p /home/root/.pip/ && \
    python /home/root/get-pip.py --timeout 100 -i https://pypi.mirrors.ustc.edu.cn/simple && \
    pip install ipython["Notebook"] PySide pyzmq numpy -vvv --timeout 100 -i https://pypi.mirrors.ustc.edu.cn/simple && \
    pip install matplotlib -vvv --timeout 100 -i https://pypi.mirrors.ustc.edu.cn/simple
