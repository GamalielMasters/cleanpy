PYTHON := python3


.PHONY: build
build: clean
	@$(PYTHON) -m tox -e build
	ls -lh dist/*

.PHONY: check
check:
	@$(PYTHON) -m tox -e lint

.PHONY: clean
clean:
	@-$(PYTHON) setup.py clean --all
	@rm -rf dist/

.PHONY: fmt
fmt:
	@$(PYTHON) -m tox -e fmt

.PHONY: release
release:
	@$(PYTHON) setup.py release --sign
	@make clean

.PHONY: setup-ci
setup-ci:
	@$(PYTHON) -m pip install -q --disable-pip-version-check --upgrade tox

.PHONY: setup
setup: setup-ci	@$(PYTHON) -m pip install -q --disable-pip-version-check --upgrade -e .[test] releasecmd
	@$(PYTHON) -m pip check
