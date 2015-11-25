#!/bin/bash
# latest run
nginx
consul-template -consul=$CONSUL_URL -log-level=debug -template="/templates/service.ctmpl:/etc/nginx/conf.d/service.conf:nginx -s reload"


