# Use the official Jupyter notebook base image
FROM jupyter/base-notebook:latest

# Switch to root user to install system packages
USER root

# Install necessary system packages including xdg-utils
RUN apt-get update && \
    apt-get install -y gcc graphviz xdg-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install conda and create environment
RUN conda create -n jupyterlab-debugger -c conda-forge jupyterlab=3 "ipykernel>=6" xeus-python && \
    echo "source activate jupyterlab-debugger" > /etc/profile.d/conda.sh

# Change ownership and permissions of the /home/jovyan/work directory
RUN mkdir -p /home/jovyan/work && \
    chown -R $NB_UID:$NB_GID /home/jovyan/work && \
    chmod -R 777 /home/jovyan/work

# Switch back to the jovyan user
USER $NB_UID

# Activate the conda environment by default
ENV PATH /opt/conda/envs/jupyterlab-debugger/bin:$PATH

# Install Python packages
RUN pip install diagrams

# Expose the notebook port and start the notebook server
EXPOSE 8888
CMD ["start-notebook.sh"]
