python = venv/bin/python

.PHONY: help
help:
	@echo "Targets:"
	@echo "venv   - Create virtual environment"
	@echo "clean  - Remove virtual environment"


venv: pip = venv/bin/pip
venv:
	python3 -m venv venv
	$(pip) install --upgrade pip
	$(pip) install wheel
	$(pip) install -r requirements.txt


.PHONY: clean
clean:
	@rm -rf venv
