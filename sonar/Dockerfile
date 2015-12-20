# Basic install of sonar with mysql
#

FROM moyan/java

ADD create_database.sql /tmp/create_database.sql

RUN apt-get install -y mysql-server
RUN /usr/bin/mysqld_safe & \
        sleep 10s && \
        mysql -u root < /tmp/create_database.sql

VOLUME ["/var/lib/mysql",   "/var/log/mysql"]

RUN cd /tmp/ && wget http://dist.sonar.codehaus.org/sonarqube-5.1.2.zip && \
        unzip sonarqube-5.1.2.zip && mv sonarqube-5.1.2 /opt/sonar && \
        rm sonarqube-5.1.2.zip

RUN sed -i 's|#wrapper.java.additional.6=-server|wrapper.java.additional.6=-server|g' /opt/sonar/conf/wrapper.conf &&\
        sed -i 's|#sonar.jdbc.password=sonar|sonar.jdbc.password=sonar|g' /opt/sonar/conf/sonar.properties &&\
        sed -i 's|#sonar.jdbc.user=sonar|sonar.jdbc.user=sonar|g' /opt/sonar/conf/sonar.properties &&\
        sed -i 's|sonar.jdbc.url=jdbc:h2|#sonar.jdbc.url=jdbc:h2|g' /opt/sonar/conf/sonar.properties &&\
        sed -i 's|#sonar.jdbc.url=jdbc:mysql://localhost|sonar.jdbc.url=jdbc:mysql://localhost|g' /opt/sonar/conf/sonar.properties 

RUN apt-get install -y supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 9000 22 3306

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
