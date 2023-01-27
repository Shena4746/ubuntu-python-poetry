#!/bin/sh

which python
python --version
poetry -n init
poetry add numpy
poetry run python3 test.py
rm -f poetry.lock pyproject.toml