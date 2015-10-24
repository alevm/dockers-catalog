# start from a registry release known to work
FROM registry:0.7.3
# get the swift driver for the registry
RUN pip install docker-registry-driver-swift==0.0.1
# SoftLayer uses v1 auth and the sample config doesn't have an option 
# for it so inject one
RUN sed -i '91i\    swift_auth_version: _env:OS_AUTH_VERSION' /docker-registry/config/config_sample.yml
