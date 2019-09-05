help:
	@echo "    run-cmdline"
	@echo "        Run the bot in the command line."
	@echo "    train"
	@echo "        Train a combined Rasa NLU and Core model."

train:
	rasa train --fixed-model-name model

run-cmdline:
	rasa run --enable-api
