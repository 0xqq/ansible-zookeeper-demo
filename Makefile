.PHONY: install run clean

SHELL=/bin/bash
VENV_NAME?=venv
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python

install:
	type python &> /dev/null || (echo "ERROR: Please Install Python"; exit 1) ;\
	python -m pip install --user --upgrade pip ;\
	python -m pip install --user virtualenv ;\
	test -d $(VENV_NAME) || python -m virtualenv $(VENV_NAME) ;\
	$(VENV_ACTIVATE) ;\
	${PYTHON} -m pip install -r requirements.txt ;\
	deactivate

run: 
	test -d $(VENV_NAME) && $(VENV_ACTIVATE) ;\
	ansible-playbook zookeeper.yml -vvv ;\
	deactivate

deprovision:
	test -d $(VENV_NAME) && $(VENV_ACTIVATE) ;\
	ansible-playbook deprovision.yml -vvv ;\
	deactivate

clean:
	test -d $(VENV_NAME) && $(VENV_ACTIVATE) && deactivate
	rm -rf venv
