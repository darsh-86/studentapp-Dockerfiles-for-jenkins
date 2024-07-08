FROM tomcat:9.0-slim
WORKDIR /opt
ENV APP_HOME=/usr/local/tomcat
ADD *.war $APP_HOME/webapps
ADD *.jar $APP_HOME/lib
ADD config /opt
RUN sed -i '20r /opt/config' $APP_HOME/conf/context.xml
EXPOSE 8080
CMD ["catalina.sh", "run"]
