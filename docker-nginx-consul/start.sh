#!/bin/bash
/usr/sbin/nginx
consul-template -consul=$CONSUL_URL -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:/usr/sbin/nginx -s reload"


