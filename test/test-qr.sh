#!bin/sh

PARENT_DIR=$(cd $(dirname $0); pwd)
file_test=${PARENT_DIR}/hello-qr.qmd
export PYDEVD_DISABLE_FILE_VALIDATION=1
poetry init -n --directory=${PARENT_DIR}
poetry add --directory=${PARENT_DIR} jupyter_client=7.3.5 jupyter matplotlib plotly \
&& quarto check \
&& quarto render ${file_test} --to gfm
rm -f ${PARENT_DIR}/poetry.lock ${PARENT_DIR}/pyproject.toml
rm -rf ${PARENT_DIR}/$(basename ${file_test} .qmd)_files