FROM tomcat:9.0-alpine
LABEL maintainer=”gmenezes”
ADD target/HelloWorldWeb-0.0.1-SNAPSHOT.war	 /usr/local/tomcat/webapps/HelloWorldWeb.war
EXPOSE 8080
CMD [“catalina.sh”, “run”]