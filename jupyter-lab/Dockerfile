FROM python:3.7.5

COPY requirements.txt requirements.txt
COPY setup.sh setup.sh

RUN apt-get update -y && apt-get install graphviz -y && python -m pip install -r requirements.txt && sh ./setup.sh

WORKDIR /home/projects

EXPOSE 8888

CMD [ "jupyter-lab","--ip=0.0.0.0", "--no-browser", "--allow-root", "--LabApp.token=''"]