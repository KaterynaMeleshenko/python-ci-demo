VENV=.venv
PYTHON=$(VENV)/bin/python
PIP=$(VENV)/bin/pip

venv:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip

install: venv
	$(PIP) install -r requirements.txt

format:
	$(VENV)/bin/black app tests

lint:
	$(VENV)/bin/ruff check app tests

test:
	$(PYTHON) -m pytest -v

run:
	$(VENV)/bin/uvicorn app.main:app --host 0.0.0.0 --port 8000

all: install format lint test