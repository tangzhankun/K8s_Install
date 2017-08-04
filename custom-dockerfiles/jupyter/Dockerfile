FROM spark-driver-py:wip

#RUN export http_proxy='http://ztang16:mnbvcxz4%406@10.239.4.80:914' \
#    && export https_proxy='http://ztang16:mnbvcxz4%406@10.239.4.80:914' \
#    && yum install -y python3\


COPY epel-release-latest-7.noarch.rpm /tmp/epel-release-latest-7.noarch.rpm

RUN export http_proxy='http://ztang16:mnbvcxz4%406@10.239.4.80:914' \
    && export https_proxy='http://ztang16:mnbvcxz4%406@10.239.4.80:914' \
    && yum install -y /tmp/epel-release-latest-7.noarch.rpm \
    && yum -y install python34-pip


RUN export http_proxy='http://ztang16:mnbvcxz4%406@10.239.4.80:914' \
    && export https_proxy='http://ztang16:mnbvcxz4%406@10.239.4.80:914' \
    && pip3 install jupyter

RUN jupyter notebook --allow-root --generate-config

ENTRYPOINT exec /usr/local/bin/tini -- jupyter notebook --no-browser --allow-root --port=5000 --NotebookApp.token='' --NotebookApp.ip='0.0.0.0' > /root/.jupyter/log 
