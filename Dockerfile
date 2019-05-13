ARG CORE_SDK_VERSION
FROM rasa-sdk:CORE_SDK_VERSION

# copy in your source code
COPY main.py .

CMD ["python", "/app/main.py"]
