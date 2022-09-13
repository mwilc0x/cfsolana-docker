#!/bin/bash

# install all dependencies

cd /app/modules/contentbox
box install

cd /app/modules/contentbox-installer
box install

cd /app/modules/cors
box install

cd /app
box install

box server start \
    trayEnable=false \
    host=0.0.0.0 \
    openbrowser=false \
    port=8080 \
    sslPort=8443 \
    saveSettings=false  \
    dryRun=false \
    console=false \
    startScript=bash \
    verbose=true

# TODO: why is container exiting?
# this keeps it alive so we can exec in
ping localhost
