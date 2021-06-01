FROM ubuntu:18.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD requirements.txt /tmp/
ADD app.py /opt/webapp/
ADD Procfile /opt/webapp/
ADD tests.py /opt/webapp/
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr /tmp/requirements.txt
WORKDIR /opt/webapp
EXPOSE 5000
CMD ["python3", "app.py"]