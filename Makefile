help:
	@echo "    run-cmdline"
	@echo "        Run the bot in the command line."
	@echo "    train-nlu"
	@echo "        Train the natural language understanding using Rasa NLU."
	@echo "    train-core"
	@echo "        Train a dialogue model using Rasa core."
	@echo "    zip-core-model"
	@echo "        Train an NLU model and zip it."
	@echo "    zip-nlu-model"
	@echo "        Train a dialogue model and zip it."

train-nlu:
	python -m rasa_nlu.train -c nlu_model_config.json --fixed_model_name current \
	       --data ./data/nlu.md --path models/ --project nlu

train-core:
	python -m rasa_core.train -s data/stories.md -d domain.yml -o models/dialogue --epochs 300

run-cmdline:
	python -m rasa_core.run -d models/dialogue -u models/nlu/current

zip-core-model:
	make train-core
	cd models/dialogue && \
	zip -r core_model.zip * && \
	mv core_model.zip ../

zip-nlu-model:
	make train-nlu && \
	cd models/nlu/current && \
	zip -r nlu_model.zip * && \
	mv nlu_model.zip ../../
