FROM spark:3.5.3-scala2.12-java17-python3-ubuntu

ENV SPARK_WORK_DIR="/opt/spark/work-dir"
ENV SPARK_ROOT_DIR="/opt/spark"
ENV PYSPARK_PYTHON=${SPARK_WORK_DIR}/venv/bin/python3

# Switch to root user for installation
USER 0
RUN apt-get update && apt-get install -y python3-dev python3-venv
RUN chown -R spark:spark ${SPARK_ROOT_DIR}

USER spark

COPY . .

# Create virtual environment and install dependencies
RUN python3 -m venv ${SPARK_WORK_DIR}/venv && \
    . ${SPARK_WORK_DIR}/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
# Expose necessary ports
EXPOSE 4040 8080 7077 8888
