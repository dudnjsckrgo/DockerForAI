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
# RUN apt-get update && apt-get install -y \
#     g++ \
#     openjdk-8-jdk \
#     python3-dev \
#     python3-pip \
#     curl
# RUN python3 -m pip install --upgrade pip
# RUN python3 -m pip install konlpy 
# RUN apt-get install curl git
# RUN curl -s -o mecab.sh https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh
# RUN bash mecab.sh
# ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk/jre
# RUN apt-get update && apt-get install -y --fix-missing g++ default-jdk
# RUN pip install konlpy
# RUN apt-get install curl git
# RUN curl -s -o mecab.sh https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh
# RUN bash mecab.sh
# apt init
ENV LANG=C.UTF-8
ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends tzdata g++ git curl

# java stuff
RUN apt-get install -y openjdk-8-jdk

# python stuff
# RUN apt-get install -y python3-pip python3-dev
# RUN cd /usr/local/bin && \
#     ln -s /usr/bin/python3 python && \
#     ln -s /usr/bin/pip3 pip && \
#     pip3 install --upgrade pip

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

# 이후의 Dockerfile 지시사항들...
