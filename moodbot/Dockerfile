FROM python:2.7-slim

SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  build-essential \
  wget \
  bzip2 \
  unzip \
  xz-utils \
  openssh-client \
  graphviz-dev \
  pkg-config \
  git-core \
  openssl \
  libssl-dev \
  libffi6 \
  libffi-dev \
  curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir /app &&\
  mkdir /app/custom &&\
  mkdir /app/core_project

WORKDIR /app

RUN pip install --only-binary=numpy,scipy,scikit-learn numpy scipy scikit-learn

# Copy as early as possible so we can cache ...

COPY requirements.txt ./
RUN pip install -r requirements.txt

ARG RASA_PYPI_USER
ARG RASA_PYPI_PASSWORD

RUN pip install -i "https://$RASA_PYPI_USER:$RASA_PYPI_PASSWORD@pypi.rasa.ai/simple/" rasa_extensions

COPY . /app

EXPOSE 5001

CMD ["python", "moodbot/main.py"]