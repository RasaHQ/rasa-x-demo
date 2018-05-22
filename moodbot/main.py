import logging
import os

from rasa_core.channels.rest import HttpInputChannel
from rasa_core.domain import TemplateDomain
from rasa_core.remote import RasaCoreClient, RemoteAgent
from rasa_extensions.core.remote import run_with_remote_core

if __name__ == "__main__":
    logging.basicConfig(level="DEBUG")

    # load your domain.yml (needs to be part of the docker container)
    domain = TemplateDomain.load("domain.yml")

    # instantiate the input channel you want to connect to
    from rasa_extensions.core.channels.rasa_chat import RasaChatInput

    input_channel = HttpInputChannel(
        5001, "/", RasaChatInput(os.environ.get("RASA_API_ENDPOINT_URL")))

    client = RasaCoreClient(os.environ.get("RASA_REMOTE_CORE_ENDPOINT_URL"),
                            os.environ.get("RASA_CORE_TOKEN"))

    agent = RemoteAgent(domain, client)

    agent.handle_channel(input_channel)
