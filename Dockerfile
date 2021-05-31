FROM 18.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD requirements.txt /tmp/
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr /tmp/requirements.txt
ADD app.py /opt/webapp
EXPOSE 5000
CMD ["python3"]