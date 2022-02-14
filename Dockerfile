FROM tensorflow/tensorflow:2.7.1-gpu-jupyter

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install build-essential nodejs npm libsndfile1

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
 apt-get install -y nodejs


# Add new user to avoid running as root
RUN useradd -ms /bin/bash tensorflow

WORKDIR /tf


COPY requirements.txt requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install jupyterlab \
    && jupyter lab build

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888
EXPOSE 6006
CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]