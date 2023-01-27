#!bin/sh

PARENT_DIR=$(cd $(dirname $0); pwd)
quarto check
poetry init -n --directory=${PARENT_DIR}
poetry add --directory=${PARENT_DIR} jupyter matplotlib plotly \
&& quarto render ${PARENT_DIR}/hello-qr.qmd --to gfm
rm -f ${PARENT_DIR}/poetry.lock ${PARENT_DIR}/pyproject.toml
rm -rf ${PARENT_DIR}/hello-qr_files