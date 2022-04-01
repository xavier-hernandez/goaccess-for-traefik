#!/bin/bash
source $(dirname "$0")/funcs/nginx.sh

x_version="GOAT v0.0.1"
x_log_path="/opt/log"

echo -e "\n${x_version}\n"

#Set NGINX basic authentication
nginx_basic_auth

#RUN NGINX
tini -s -- nginx

#RUN GOACCESS
tini -s -- /goaccess/goaccess /opt/log/access.log --no-global-config --config-file=/goaccess-config/goaccess.conf