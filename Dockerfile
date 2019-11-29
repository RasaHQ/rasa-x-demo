ARG RASA_SDK_VERSION
FROM rasa/rasa-sdk:$RASA_SDK_VERSION

# copy in your source code
COPY main.py .

CMD ["run", "python", "/app/main.py"]
