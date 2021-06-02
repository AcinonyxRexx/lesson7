FROM ubuntu:18.04
ADD requirements.txt /tmp/
WORKDIR /opt/webapp/
ADD * /opt/webapp/
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr /tmp/requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]