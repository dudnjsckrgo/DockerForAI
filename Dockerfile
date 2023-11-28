FROM tensorflow/tensorflow:latest-gpu-jupyter

# 필요한 라이브러리 설치
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/* && \
    pip install jupyterlab_nvdashboard && \
    pip install jupyterlab-lsp && \
    pip install jupyter-resource-usage
# 이후의 Dockerfile 지시사항들...
