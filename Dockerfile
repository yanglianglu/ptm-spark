FROM spark:3.5.3-scala2.12-java17-python3-ubuntu

# Set environment variables
ENV SPARK_WORK_DIR="/opt/spark/work-dir"
ENV PYSPARK_PYTHON=python3 \
    PATH="${SPARK_WORK_DIR}/venv/bin:$PATH"
    
# Switch to root user for installation
USER 0
RUN apt-get update && apt-get install -y python3-dev python3-venv
RUN mkdir -p /home/spark/ && \
    chown -R spark:spark /home/spark


# Copy application files
COPY spark_dev.py spark_dev.py
COPY spark_dev.ipynb spark_dev.ipynb
COPY requirements.txt requirements.txt



# Create virtual environment and install dependencies
RUN python3 -m venv ${SPARK_WORK_DIR}/venv && \
    . ${SPARK_WORK_DIR}/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt


# Expose necessary ports
EXPOSE 4040 8080 7077 8888

# Start JupyterLab
CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--no-browser", "--port=8888"]

# docker run -p 4040:4040 -p 8080:8080 -p 7077:7077 -p 8888:8888 ptm:spark