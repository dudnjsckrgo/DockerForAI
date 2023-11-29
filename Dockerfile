FROM tensorflow/tensorflow:latest-gpu-jupyter

# 필요한 라이브러리 설치
RUN apt-get update 
RUN apt-get install -y libgl1-mesa-glx 
RUN rm -rf /var/lib/apt/lists/*
RUN pip install jupyter-resource-usage
# 이후의 Dockerfile 지시사항들...