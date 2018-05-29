import logging
import os

from rasa_core.channels.rest import HttpInputChannel
from rasa_core.remote import RemoteAgent

if __name__ == "__main__":
    logging.basicConfig(level="DEBUG")

    # instantiate the input channel you want to connect to
    from rasa_extensions.core.channels.rasa_chat import RasaChatInput

    input_channel = HttpInputChannel(
        5001, "/", RasaChatInput(os.environ.get("RASA_API_ENDPOINT_URL")))

    agent = RemoteAgent.load('models/dialogue',
                             os.environ.get("RASA_REMOTE_CORE_ENDPOINT_URL"),
                             os.environ.get("RASA_CORE_TOKEN"))

    agent.handle_channel(input_channel)
