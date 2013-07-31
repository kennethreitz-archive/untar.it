## Python

REQUIREMENTS_FILE=requirements.txt
REQUIREMENTS_OUT=requirements.txt.log


all: requirements

requirements: virtualenv $(REQUIREMENTS_OUT)

$(REQUIREMENTS_OUT): $(REQUIREMENTS_FILE)
	pip install -r $(REQUIREMENTS_FILE) | tee -a $(REQUIREMENTS_OUT)

clean:
	find . -name "*.py[oc]" -delete
	find . -name "__pycache__" -delete
	rm $(REQUIREMENTS_OUT)

virtualenv:
ifndef VIRTUAL_ENV
	$(error No VIRTUAL_ENV defined)
endif


## Composer

COMPOSER_INDEX=indexer:UntaritIndexer

build: requirements index.json
	composer build $(COMPOSER_INDEX)

serve: requirements index.json
	composer serve $(COMPOSER_INDEX)

deploy: build
	s3cmd sync build/ s3://untar.it/
