FROM spark-driver-py:wip

RUN jupyter notebook --allow-root --generate-config

ENTRYPOINT exec /sbin/tini -- jupyter notebook --no-browser --allow-root --port=5000 --NotebookApp.token='' --NotebookApp.ip='0.0.0.0' > /root/.jupyter/log 
