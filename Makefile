help:
	@echo "    run-cmdline"
	@echo "        Run the bot in the command line."
	@echo "    train"
	@echo "        Train a combined Rasa NLU and Core model."
	@echo "    zip-model"
	@echo "        Train a Rasa model and zip it."

train:
	rasa train

run-cmdline:
	rasa run --enable-api

zip-model:
	make train
	cd models && \
	zip -r model.zip * && \
	mv model.zip ../
