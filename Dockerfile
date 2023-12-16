FROM tensorflow/tensorflow:latest-gpu-jupyter

# 필요한 라이브러리 설치
RUN apt-get update 
RUN apt-get install -y libgl1-mesa-glx 
RUN rm -rf /var/lib/apt/lists/*
RUN pip install pandas
RUN pip install notebook
RUN pip install jupyter-resource-usage
RUN pip install tensorboard
RUN pip install tensorboard-plugin-wit




ENV LANG=C.UTF-8
ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata g++ git curl

# java stuff
RUN apt-get install -y openjdk-8-jdk


# apt cleanse
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# timezone
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# workspace
RUN mkdir -p /workspace
WORKDIR /workspace

# install python packages
RUN pip install konlpy
RUN pip install --upgrade --user setuptools==58.3.0
RUN pip install mecab-python3
RUN cd /workspace && \
    curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh | bash -s
RUN pip install opencv-python

RUN apt install -y graphviz

RUN pip install aquirdturtle_collapsible_headings
# 이후의 Dockerfile 지시사항들...
RUN apt-get update 
RUN apt-get install -y nodejs npm 
RUN rm -rf /var/lib/apt/lists/*

RUN pip install nltk
RUN pip install --upgrade notebook
RUN pip install --upgrade jupyter-lsp
RUN pip install pydot
RUN apt install  graphviz -y
RUN pip install seaborn
RUN pip install matplotlib
RUN pip install scikit-learn
RUN apt update
RUN apt install -y wget
# RUN  pip install -U "jupyter-server<2.0.0"
# RUN pip install lckr-jupyterlab-variableinspector
#RUN pip install jupyterlab_nvdashboard
# RUN pip install jupyterlab-lsp
# RUN pip install python-lsp-server[all]
# RUN npm i @krassowski/jupyterlab-lsp