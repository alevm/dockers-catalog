#!/bin/bash
systemctl start nginx.service
consul-template -consul=$CONSUL_URL -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:systemctl reload nginx.service"


