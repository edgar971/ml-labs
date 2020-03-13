FROM python:3.7.5

COPY requirements.txt requirements.txt
COPY setup.sh setup.sh

RUN sh ./setup.sh \
    && apt-get update \
    && apt-get install graphviz -y \
    && python -m pip install -r requirements.txt

WORKDIR /home/projects

EXPOSE 8888

CMD [ "jupyter-lab","--ip=0.0.0.0", "--no-browser", "--allow-root"]