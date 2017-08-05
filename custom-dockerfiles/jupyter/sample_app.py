import os

from operator import add
from random import random

from pyspark.sql import SparkSession

spark = SparkSession\
      .builder\
      .config("spark.app.name", "spark-pi")\
      .config("spark.submit.deployMode", "client")\
      .config("spark.master", "k8s://http://{}:{}".format(
        os.getenv("KUBERNETES_SERVICE_HOST"),
        os.getenv("KUBERNETES_SERVICE_PORT")
      ))\
      .config("spark.kubernetes.driver.pod.name", os.getenv("HOSTNAME"))\
      .config("spark.kubernetes.driver.docker.image", "172.16.3.78:4000/spark-driver-py:wip")\
      .config("spark.kubernetes.executor.docker.image", "172.16.3.78:4000/spark-executor-py:wip")\
      .config("spark.kubernetes.initcontainer.docker.image", "172.16.3.78:4000/spark-init:wip")\
      .config("spark.kubernetes.docker.image.pullPolicy", "Always")\
      .getOrCreate()

def f(_):
    x = 2 * random() - 1
    y = 2 * random() - 1
    return 1 if x**2 + y**2 <= 1 else 0

partitions = 100
n = 100000 * partitions

count = spark.sparkContext.parallelize(range(1, n + 1), partitions).map(f).reduce(add)
print "Pi is approximately %f" % (4.0 * count / n)
