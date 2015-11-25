#!/bin/bash
nginx
consul-template -consul=$CONSUL_URL -log-level=debug -template="/templates/$CONSUL_DOMAIN.service.ctmpl:/etc/nginx/conf.d/service.conf:nginx -s reload"


