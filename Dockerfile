FROM 14.04
ENV TZ=Europe/Kiev
ADD
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install default-jdk tomcat9 maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f ./boxfuse-sample-java-war-hello/ package
RUN cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]