from rasa_core.channels.rest import HttpInputChannel
from rasa_extensions.core.remote import run_with_remote_core
from rasa_core.domain import TemplateDomain
import os
import logging

if __name__ == "__main__":
    logging.basicConfig(level="DEBUG")

    # load your domain.yml (needs to be part of the docker container)
    domain = TemplateDomain.load("domain.yml")

    # instantiate the input channel you want to connect to
    from rasa_extensions.core.channels.rasa_chat import RasaChatInput

    input_channel = HttpInputChannel(5001,
                                     "/",
                                     RasaChatInput(os.environ.get("RASA_API_ENDPOINT_URL"))
                                     )

    run_with_remote_core(os.environ.get("RASA_REMOTE_CORE_ENDPOINT_URL"),
                         os.environ.get("RASA_CORE_TOKEN"),
                         domain,
                         input_channel)
