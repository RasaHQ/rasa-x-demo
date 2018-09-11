FROM python:3.6-slim

SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq && \
	apt-get install -y --no-install-recommends \
  build-essential \
  git-core && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir /app

WORKDIR /app

RUN pip install gevent==1.2.2

ARG CORE_SDK_VERSION
RUN pip install git+https://github.com/RasaHQ/rasa_core_sdk.git@${CORE_SDK_VERSION}#egg=rasa_core_sdk

COPY main.py .

EXPOSE 5001

CMD ["python", "/app/main.py"]
