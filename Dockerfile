FROM ubuntu:18.04
ADD requirements.txt /tmp/
WORKDIR /opt/webapp/
ADD app.py /opt/webapp/
ADD Procfile /opt/webapp/
ADD tests.py /opt/webapp/
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr /tmp/requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]