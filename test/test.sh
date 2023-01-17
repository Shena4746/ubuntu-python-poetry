#!/bin/sh

scr=temp_dir_for_test
poetry new ${scr}
cp test.py ${scr}/${scr}
cd ${scr}/${scr}
poetry add numpy
poetry run python3 test.py
cd -
rm -rf ${scr}
which python
python --version
echo "test successfully done!"