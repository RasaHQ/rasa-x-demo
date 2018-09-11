import logging

from gevent.pywsgi import WSGIServer
from rasa_core_sdk.endpoint import endpoint_app

logger = logging.getLogger(__name__)

if __name__ == "__main__":
    logging.basicConfig(level="DEBUG")

    logging.basicConfig(level=logging.DEBUG)
    logger.info("Starting action endpoint server...")

    app = endpoint_app(cors_origins="*",
                       action_package_name=None)

    http_server = WSGIServer(('0.0.0.0', 5001), app)

    http_server.start()
    logger.info("Action endpoint is up and running. on {}"
                "".format(http_server.address))

    http_server.serve_forever()
