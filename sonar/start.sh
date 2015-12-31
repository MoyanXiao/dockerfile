#!/bin/bash 

docker run -i -t -d -p 9000:9000 -p 3306:3306 --name sonar-server moyan/sonar-server
