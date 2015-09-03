# Dockerfile that builds a minimal container for IPython + narrative
#
# Copyright 2013 The Regents of the University of California,
# Lawrence Berkeley National Laboratory
# United States Department of Energy
# The DOE Systems Biology Knowledgebase (KBase)
# Made available under the KBase Open Source License
#
FROM kbase/depl:latest
MAINTAINER Shane Canon scanon@lbl.gov

ADD ./njs_wrapper /kb/dev_container/modules/njs_wrapper

# Use the first line if you are starting a new service not in deployment.cfg, use the second line if you are modifying an already running service.
#RUN cd /kb/dev_container/modules/THIS_MODULE && . ../../user-env.sh && make && make deploy && cat deploy.cfg >> /kb/deployment/deployment.cfg
RUN cd /kb/dev_container/modules/njs_wrapper && . ../../user-env.sh && make && make deploy

# Make any changes to ensure the service runs in the foreground.

# Do not set the docker instruction "CMD", as this would overwrite kbase defaults.
