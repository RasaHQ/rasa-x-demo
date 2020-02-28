import logging

from rasa_sdk import constants, endpoint

logger = logging.getLogger(__name__)

if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    logging.getLogger("matplotlib").setLevel(logging.WARN)

    # if you create custom actions, use a module path for the action package to
    # point the server to them e.g. "mymodule.actions"
    # noinspection PyTypeChecker
    endpoint.run(
        None,  # action package
        constants.DEFAULT_SERVER_PORT,  # port of the web server
        "*",  # cors origins
    )
