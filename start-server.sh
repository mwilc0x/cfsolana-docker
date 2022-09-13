#!/bin/bash

cd /app
box install

cd /app/modules/contentbox
box install

cd /app/modules/contentbox-installer
box install

cd /app/modules/cors
box install

cd /app

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

ping localhost
