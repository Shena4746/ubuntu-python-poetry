FROM ubuntu:jammy as python-base
ENV HOME /root
# default python version. might be overwritten by docker build command
ARG PYTHON_VERSION=3.11.0
ENV PYTHON_ROOT ${HOME}/local/python${PYTHON_VERSION}
ENV PATH $PYTHON_ROOT/bin:$PATH
ENV POETRY_HOME ${HOME}/.local/share/pypoetry

FROM python-base as builder
ENV PYENV_ROOT ${HOME}/.pyenv
# install python by pyenv
RUN apt update
# install build tools for python 
RUN apt install -y git curl \
	build-essential libbz2-dev libdb-dev \
	libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
	libncursesw5-dev libsqlite3-dev libssl-dev \
	zlib1g-dev uuid-dev
RUN git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT}
# install python via pyhon-build
RUN ${PYENV_ROOT}/plugins/python-build/install.sh
RUN /usr/local/bin/python-build ${PYTHON_VERSION} ${PYTHON_ROOT}
# install poetry 
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=${POETRY_HOME} python3 -
# save git files for main image
RUN find /usr -name git* | xargs tar czf gits.tar.gz
# remove builders
RUN rm -rf ${PYENV_ROOT}
RUN apt remove --purge -y git curl \
	build-essential libbz2-dev libdb-dev \
	libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
	libncursesw5-dev libsqlite3-dev libssl-dev \
	zlib1g-dev uuid-dev
RUN apt -y autoremove
RUN apt -y clean
RUN rm -rf /var/lib/apt/lists/*

FROM python-base
ENV PATH ${POETRY_HOME}/bin:$PATH
ENV POETRY_VIRTUALENVS_CREATE=false
# copy python, poetry and git
COPY --from=builder ${PYTHON_ROOT} ${PYTHON_ROOT}
COPY --from=builder ${POETRY_HOME} ${POETRY_HOME}
COPY --from=builder /gits.tar.gz /gits.tar.gz
RUN tar xzf gits.tar.gz \
	&& rm -f gits.tar.gz
WORKDIR /workdir